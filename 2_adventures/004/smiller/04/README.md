# 004/04

## What’s Next

We don’t actually need to persist at this point.  We could just build a Lotus app that lets you type an Entry in a textarea, press a preview button, and then displays the result.

Eventually we’ll want persistence, full text search, proper navigating, possibly a javascript framework front-end that updates a html-formatted preview in real time (which would involve reimplementing the html formatting in the front end), but for now, let’s just get a UI and verify that typing the entry into a textarea works how we would like, since that’s the most user-facing bit of functionality.

### Explore Lotusrb

So let’s start up (following http://lotusrb.org/ and http://lotusrb.org/guides/getting-started/):

```
gem install lotusrb
lotus new entries --database=postgres --test=rspec
cd entries && bundle
bundle exec lotus server
```

Add a route:

```
# apps/web/config/routes.rb
get '/', to: 'home#index'
```

Refresh the page, just for fun, and get the error:

```
Boot Error

Something went wrong while loading /Users/seanmiller/code/21-day-challenge/2_adventures/004/smiller/04/entries/config.ru

Lotus::Routing::EndpointNotFound: uninitialized constant Controllers::Home
```

Add a controller:

```
# apps/web/controllers/home/index.rb
module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
    end
  end
end
```

(Interesting, Lotus is using the controller-per-action model.)

And refresh, just (again) to see the error message:

```
Boot Error

Something went wrong while loading /Users/seanmiller/code/21-day-challenge/2_adventures/004/smiller/04/entries/config.ru

NameError: uninitialized constant Web::Views::Home
```

Add a view:

```
# apps/web/views/home/index.rb
module Web::Views::Home
  class Index
    include Web::View
  end
end
```

One more error on refresh:

```
Boot Error

Something went wrong while loading /Users/seanmiller/code/21-day-challenge/2_adventures/004/smiller/04/entries/config.ru

Lotus::View::MissingTemplateError: Can't find template 'home/index' for 'html' format.
```

And add a template:

```
# apps/web/templates/home/index.html.erb
<h1>Entries</h1>
```

Hmm.  Is there another lotus new --switch that lets me default to haml?  No, but the [views guide](http://lotusrb.org/guides/views/templates/) says I can just include the gem and change the file suffix.  Hmm.  Wonder if that means I can use the faster implementation [hamlit](https://github.com/k0kubun/hamlit) instead?  Let’s try.

Um, well:

```
Boot Error

Something went wrong while loading /Users/seanmiller/code/21-day-challenge/2_adventures/004/smiller/04/entries/config.ru

LoadError: cannot load such file -- haml

/Users/seanmiller/.rvm/gems/ruby-2.0.0-p598/gems/lotusrb-0.4.0/lib/lotus/loader.rb:126:in `module_eval'
/Users/seanmiller/.rvm/gems/ruby-2.0.0-p598/gems/tilt-2.0.1/lib/tilt/haml.rb:2:in `<top (required)>'
```

Which reminds me that I haven’t used hamlit anywhere else either, so let’s reduce the number of unknowns, switch back to `gem 'haml'`, and carry on.  And now we finally get our first custom view.

```
# apps/web/templates/home/index.html.haml
%h1 Entries
%textarea{rows: 40, cols: 80}
```

Hmm.  Also very interesting that you can put the form in the view class:

```
def form
  form_for :entry, "/" do
    textarea :body, cols: "80", rows: "40"
    submit "Preview"
  end
end
```

### Hmm.  Edge of Timebox, and…

But now I’m within sight of the edge of my timebox and in a quandary.  I’m loving the clean architectural decisions of lotusrb, and I’m curious to explore further.

But if my most important goal had been hacking together something to test the textarea input and html-formatted output, if I’d started with Rails it would be done by now and I would be testing it and getting that feedback.

For that matter, if I end up devising something which does the reformatting in real time on the client-side, so there isn’t a text area preview but a panel of html which you can type into and use “>” as an indent shortcut, this whole iteration of the 21-day-challenge could turn into javascript.  (Though having input an entry, there will eventually be a back-end required.)

Since my main goal is learning, and not least-risky-time-to-market-for-a-new-product, I’m happy for today to have been a “start exploring lotusrb” day.  On a different project, that priority might been different.
