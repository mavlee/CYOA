define ['jquery', 'underscore', 'backbone', 'common', 'story_node'], \
       ($, _, Backbone, common, storyNode) ->

  StoryNodeModel = storyNode.StoryNodeModel

  StoryNodeView = Backbone.View.extend
    className : 'story-node'
    initialize : (options) ->
      _.bindAll(this)
      this.model.bind 'change', this.render
      this.template = common.template $('#story-node-tpl').html()
    render : () ->
      $(this.el).html(this.template(this.model.toJSON()))
      return this

  return {
    StoryNodeModel : StoryNodeModel
    StoryNodeView  : StoryNodeView
  }
