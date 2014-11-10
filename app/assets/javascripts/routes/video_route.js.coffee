App.VideoRoute = Ember.Route.extend
  model: (params) ->
    return @store.find('video', params.video_id)
