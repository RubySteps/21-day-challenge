# Day 10

## Back to Page Objects

### Site_prism and wait_for

https://github.com/natritmeyer/site_prism

Looking at site_prism’s README, one thing that concerns me is the
`wait_for_<element>` methods.  Capybara switched over to an implicit wait on
`page.find` calls, and while I’ve been caught because `page.fill_in` seems not
to use the implicit wait, I have enjoyed not having to include `wait_for`
throughout test code, even if I do sometimes need a `page.find` before a
`page.fill_in` in an Angular-heavy app.  (Could probably get around
that with a wrapper method that finds and fills in, now I think of it.  Wonder
if something like that already exists?)

The reintroduction of `wait_for` has been discussed:
https://github.com/natritmeyer/site_prism/issues/41

and there’s a configuration option to switch back to implicit waits:
https://github.com/natritmeyer/site_prism/pull/43

```ruby
SitePrism.configure do |config|
  config.use_implicit_waits = true
end
```

which would I think mean you could simplify the README example of

```ruby
Then /^the search results page contains 10 individual search results$/ do
  @results_page.wait_for_search_results
  expect(@results_page).to have_search_results count: 10
end
```

to

```ruby
Then /^the search results page contains 10 individual search results$/ do
  expect(@results_page).to have_search_results count: 10
end
```

which I prefer.  (I may be working in more data-heavy Angular apps where I have
less precise control on when things show up on the page.)

### Another framework option

From Day 7, I had been aware of https://github.com/cheezy/page-object (which I’d
used before) and https://github.com/natritmeyer/site_prism.  This morning I’ve
discovered https://github.com/jnyman/symbiont.

Here are nutshells of all three, taken from READMEs and wikis:

#### page-object

```ruby
class LoginPage
  include PageObject

  page_url "/login.html"

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, id: 'login')
  button(:close, class: 'close')

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end
```

We were using page-object for QA testing, so we made page_url the
fully-qualified URL on the staging server and ran cukes against that.  Being
able to interact with the UI like

```ruby
visit RegistrationPage do |page|
  page.register_user
  page.do_something_else
end
```

was nicely compact.  (https://github.com/cheezy/page-object/wiki/Creating-and-using-page-objects)

#### site_prism

```ruby
class Home < SitePrism::Page
  set_url "/index.html"
  set_url_matcher /google.com\/?/

  element :search_field, "input[name='q']"
  element :search_button, "button[name='btnK']"
  elements :footer_links, "#footer a"
  section :menu, MenuSection, "#gbx3"
end

# define sections used on multiple pages or multiple times on one page

class MenuSection < SitePrism::Section
  element :search, "a.search"
  element :images, "a.image-search"
  element :maps, "a.map-search"
end
```

I like site_prism’s ability to define sections as subsets of elements, and to
define lists of elements.  I miss the `visit_page { do_stuff_on_page }` syntax,
but that might be something that could be added.

#### symbiont

```ruby
class Stardate
  attach Symbiont

  url_is      'http://localhost:9292/stardate'
  url_matches /:\d{4}\/stardate/
  title_is    'Dialogic - Stardate Calculator'

  checkbox   :enable,        id: 'enableForm'
  radio      :tng_era,       id: 'tngEra'
  text_field :stardate,      id: 'stardateValue'
  text_field :calendar,      id: 'calendarValue'
  button     :convert,       id: 'convert'
  div        :message,    class: 'notice'

  def convert_tng_date(value)
    enable.check
    tng_era.set
    stardate.set value
    convert.click
  end

  def date_should_contain(value)
    expect(calendar.value).to match value
  end

  def date_should_be(value)
    expect(calendar.value).to eq value
  end
end
```

Symbiont lets you do the same compact UI interaction as page-object: (https://github.com/jnyman/symbiont/wiki/Basic-Context-Factory)

```ruby
on_view(Stardate) do |page|
  page.convert_tng_date('56844.9')
  page.date_should_contain('2379')
  page.date_should_be('Mon, 05 Nov 2379 09:19:26 GMT')
end
```

#### Hmmm…

I think when we were using page-object on top of watir-webdriver the implicit
`when_present` wait wasn’t always reliable, so we ended up with a helper method
that called `Watir::Wait.until` in the background.  If that is also a problem
with symbiont (which seems to wrap the `when_present` functionality the same
way: https://github.com/jnyman/symbiont/wiki/Wait-States), that might be a
reason to start with site_prism.  Provided that it does the right thing: this
might just be a hard problem.

It seems likely that any of the three could do the job, though how successfully
they each deal with waiting would be one of the first things to look at, and
more detailed investigation is necessary.
