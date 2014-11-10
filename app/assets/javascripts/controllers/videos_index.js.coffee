App.VideosIndexController = Ember.ArrayController.extend
  sortProperties: ['title']

  videos: (->
    if @get('search') then @get('searchedVideos') else @
  ).property('search', 'searchedVideos')

  searchedVideos: (->
    search = @get('search').toLowerCase()
    @filter (video) => video.get('title').toLowerCase().indexOf(search) != -1
  ).property('search', '@each.title')

