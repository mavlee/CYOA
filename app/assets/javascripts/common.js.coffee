# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.

define ['underscore'], (_) ->
  commonInit = ->
    _.templateSettings =
      interpolate: /\{\{(.+?)\}\}/g,
      evaluate: /\{\{\=(.+?)\}\}/g

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
