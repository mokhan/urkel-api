App.VideosNewController = Ember.Controller.extend
  actions:
    createVideo: ->
      fields = @get('fields')
      if App.Video.valid(fields)
        video = @store.createRecord('video', @get('fields'))
        video.save().then =>
          @transitionTo('video', video)
      else
        @set('showError', true)
