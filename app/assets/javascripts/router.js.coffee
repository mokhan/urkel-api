# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'videos'
  @resource 'video', { path: '/video/:video_id' }
