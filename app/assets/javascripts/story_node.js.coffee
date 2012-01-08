define ['backbone'], (Backbone) ->

  StoryNodeModel = Backbone.Model.extend
    defaults :
      title   : ''
      content : ''
    initialize : (options) ->
      this.set { branches : [] } if not options.branches?

  return {
    StoryNodeModel : StoryNodeModel
  }


