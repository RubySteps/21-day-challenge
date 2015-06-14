# Day 12

## The Problem

In site_prism, to instantiate, visit, and interact with a page object, I need to code:

```ruby
@login_page = LoginPage.new
@login_page.load
@login_page.logs_in(user)
```

or, a bit less repetitively:

```ruby
LoginPage.new.tap do |page|
  page.load
  page.logs_in(user)
end
```

In page-object, on the other hand, I can code:

```ruby
visit(LoginPage).do |page|
  page.logs_in(user)
end
```

and if there’s just a single interaction with the page object, I can even code:

```ruby
visit(LoginPage).logs_in(user)
```

How can I add that same shorthand to site_prism?

## The Quick Fix

The quickest route to a solution is to examine the prior art in page-object, which we can find [here](https://github.com/cheezy/page-object/blob/master/lib/page-object/page_factory.rb), with a reference to an earlier article [here](http://watirmelon.com/2011/06/07/removing-local-page-references-from-cucumber-steps/).

From which it emerged that the quickest way of implementing this for site_prism would be to add, as (say) `features/support/page_object_helpers.rb`:

```ruby
module PageObjectHelpers
  def visit(page_class, &block)
    page = page_class.new
    page.load
    block.call page if block
    page
  end
end
World(PageObjectHelpers)
```

Running the larger suite reveals a problem: capybara also has a `visit` method (not a problem for page-object or symbiont because they’re based on watir-webdriver instead of capybara).  So we’ll need to rename.  How about

```ruby
visit_page(:login).logs_in(user)
```

and

```ruby
module PageObjectHelpers
  def visit_page(page_name, &block)
    Object.const_get("#{page_name.capitalize}Page").new.tap do |page|
      page.load
      block.call page if block
    end
  end
end
World(PageObjectHelpers)
```

## Further Questions

That does the immediate trick, though we’ll probably want to expand it going forward.

For instance, both page-object and symbiont distinguish between `visit` methods and `on` methods, which can be called if the browser is already on a given page.  Haven’t determined how site_prism handles that, but if you can just instantiate a page and not run `page.load` on it if the browser is already on that page, we’ll want to make loading the page a conditional step.

Also our `Object.const_get("#{page_name.capitalize}Page").new` will almost certainly break when faced with further-namespaced pages, like `AreaOfFunctionality::StepOnePage`.  We’ll see that when we add some tomorrow.
