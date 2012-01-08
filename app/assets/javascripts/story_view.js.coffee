define ['underscore', 'backbone', 'story', 'common'], \
       (_, Backbone, story, common) ->

  StoryModel      = story.StoryModel
  StoryCollection = story.StoryCollection

  StoryCompactView = Backbone.View.extend
    initialize : (options) ->
      _.bindAll(this)
      this.model.bind 'change', this.render
      this.template = common.template $('#story-compact-view-tpl').html()
    render : () ->
      $(this.el).html(this.template(this.model.toJSON()))
      return this

  StoryListView = Backbone.View.extend
    tagName : 'ul'
    collection : null, # initialized in constructor
    initialize : (options) ->
      _.bindAll(this)

      this.collection.bind 'add', this.addOne
      this.collection.bind 'reset', this.addAll
    addOne : (model) ->
      view = new StoryCompactView
        model   : model
        tagName : 'li'
      $(this.el).append view.render().el
    addAll : () ->
      this.collection.each(this.addOne)
    render : () ->
      $(this.el).empty()
      this.addAll()
      return this

  return {
    StoryCompactView : StoryCompactView
    StoryListView    : StoryListView
    StoryModel       : StoryModel
    StoryCollection  : StoryCollection
  }
