# Day 11

## Looking at adding page objects to an existing project

Because the project is not open-source, this will be more a journal entry about
things discovered on the way than a worked example.

### Where to put page objects?

On a previous project, I put them in `features/page_objects`.  On a project with
feature specs as well as cucumber scenarios, I would be prepared to move them to
the more discoverable `#{Rails.root}/page_objects`, though a bit of me niggles
against adding a third test-related directory to the project root directory.

If I had absolute control, I would probably move `spec` and `features` and
`page_objects` under a `tests` directory.  Absent complete control, and also
absent feature specs, I’ll stick with `features/page_objects`.

### SitePrism implementation

Having now implemented `LoginPage < SitePrism::Page` and run a login feature, my
main complaint remains that whereas in page-object I could run

```ruby
visit(LoginPage).logs_in(user)
```

itself short-hand for

```ruby
visit(LoginPage).do |page|
  page.logs_in(user)
end
```

in site_prism I need to do, slightly more long-windedly:

```ruby
@login_page = LoginPage.new
@login_page.load
@login_page.logs_in(user)
```

which I can make slightly less repetitive as

```ruby
  LoginPage.new.tap do |page|
    page.load
    page.logs_in(user)
  end
```

but I would definitely want to add syntactic sugar to make the page-object-like
shortcuts available in site_prism
