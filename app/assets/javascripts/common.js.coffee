define ['underscore'], (_) ->
  commonInit = ->
    _.templateSettings =
      evaluate    : /\{%(.+?)%\}/g
      interpolate : /\{\{\=(.+?)\}\}/g,
      escape      : /\{\{(.+?)\}\}/g

  class Route
    constructor : (@baseUrl) ->

    index   : ()   -> "#{ @baseUrl }/"
    new     : ()   -> "#{ @baseUrl }/new"
    edit    : (id) -> "#{ @baseUrl }/#{ id }/edit"
    show    : (id) -> "#{ @baseUrl }/#{ id }"
    update  : (id) -> "#{ @baseUrl }/#{ id }"
    destroy : (id) -> "#{ @baseUrl }/#{ id }"

  ROUTES =
    stories : new Route '/stories'

  template = (text, context) ->
    extraHelpers =
      ROUTES : ROUTES
      _      : _

    if context?
      return _.template(text, _.extend(extraHelpers, context))
    else
      return (context) ->
        _.template(text, _.extend({}, extraHelpers, context))


  return {
    commonInit : commonInit
    ROUTES     : ROUTES
    template   : template
  }
