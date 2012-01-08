require ['jquery', 'common', 'story_node_view' ], ($, common, storyNodeView) ->
  common.commonInit()
  $ ->
    view = new storyNodeView.StoryNodeView
      el : '#story-node-placeholder'
      model : new storyNodeView.StoryNodeModel(window.BranchItOut.storyNode)
    view.render()

