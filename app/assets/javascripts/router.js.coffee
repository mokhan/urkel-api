# For more information see: http://emberjs.com/guides/routing/

Mocode.Router.map ()->
  @resource 'videos'
  @resource 'video', { path: '/video/:video_id' }
