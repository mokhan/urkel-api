App.VideoController = Ember.ObjectController.extend(
  isEditing: false
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute('videos')
)

