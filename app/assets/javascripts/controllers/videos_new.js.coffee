App.VideosNewController = Ember.Controller.extend
  actions:
    createVideo: ->
      video = @store.createRecord('video', @get('fields'))
      video.save().then =>
        @transitionTo('video', video)
