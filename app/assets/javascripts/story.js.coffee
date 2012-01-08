define ['backbone'], (Backbone) ->

  StoryModel = Backbone.Model.extend
    defaults :
      title       : ''
      description : ''
      category    : null

  StoryCollection = Backbone.Collection.extend
    model : StoryModel

  return {
    StoryModel      : StoryModel
    StoryCollection : StoryCollection
  }
