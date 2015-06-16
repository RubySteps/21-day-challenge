# Day 15

## The Template Refactoring

Last time we were contemplating refactoring

```ruby
module PageObjects
  def visit_page(page_name, args = {}, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      page.load(args)
      block.call page if block
    end
  end

  def on_page(page_name, args = {}, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      expect(page).to be_displayed(args)
      block.call page if block
    end
  end
end
```

and I still don’t think it would be the right time to do it in a real project.  But just for fun, how might we do it?

```ruby
module PageObjects
  def visit_page(page_name, args = {}, &block)
    interact_with_page(page_name, block) do |page|
      page.load(args)
    end
  end

  def on_page(page_name, args = {}, &block)
    interact_with_page(page_name, block) do |page|
      expect(page).to be_displayed(args)
    end
  end

  def interact_with_page(page_name, lambda, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      yield page
      lambda.call page if lambda
    end
  end
end
```

This avoids repeating the code that creates the page object, but because of the confusion of arguments we’re passing back and forth it ends up feeling more complicated and harder-to-follow than the original.  An easier-to-follow refactoring that might be worth doing is:

```ruby
module PageObjects
  def visit_page(name, args = {}, &block)
    build_page(name).tap do |page|
      page.load(args)
      block.call page if block
    end
  end

  def on_page(name, args = {}, &block)
    build_page(name).tap do |page|
      expect(page).to be_displayed(args)
      block.call page if block
    end
  end

  def build_page(name)
    Object.const_get("PageObjects::#{name.capitalize}").new
  end
end
```
