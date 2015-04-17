#= require jquery
#= require jquery_ujs
#= require react
#= require_tree .

$ ->
  virtualDomAfterClick = React.DOM.div(
    {id: "render-me-react-please"},
    React.DOM.span({}, "You clicked.")
  )

  linkClicked = (event) ->
    React.render(
      virtualDomAfterClick,
      document.body
    )

  virtualDomBeforeClick = React.DOM.div(
    {id: "render-me-react-please"},
    React.DOM.a(
      {href:"javascript:void(0)", onClick: linkClicked},
      "Click here"
    )
  )

  React.render(
    virtualDomBeforeClick,
    document.body
  )
