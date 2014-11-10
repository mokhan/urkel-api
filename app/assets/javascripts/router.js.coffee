# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route "settings", { path: "/settings" }
  @route "profile", { path: "/profile" }
  @route "help", { path: "/help" }
  @resource 'videos', ->
    @route 'new'
    @resource 'video', { path: ':video_id' }, ->
      @route 'edit'
