App.VideoEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      if @get('model.isDirty')
        @get('model').save().then => @transitionToRoute('video')
      else
        @transitionToRoute('video')

    cancel: -> 
      @get('model').rollback()
      @transitionToRoute('video')

  showUnsavedMessage: (->
    @get('isDirty') and !@get('isSaving')
  ).property('isDirty', 'isSaving')
