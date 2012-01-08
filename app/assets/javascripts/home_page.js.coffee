require ['jquery', 'common', 'story_view' ], ($, common, storyView) ->
  common.commonInit()

  $ ->
    storyList = new storyView.StoryListView
      el         : '#story-list-placeholder'
      collection : new storyView.StoryCollection(window.BranchItOut.stories)

    storyList.render()
