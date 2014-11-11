App.ServiceEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      if @get('model.isDirty')
        @get('model').save().then => @transitionToRoute('service')
      else
        @transitionToRoute('service')

    cancel: ->
      @get('model').rollback()
      @transitionToRoute('service')

  showUnsavedMessage: (->
    @get('isDirty') and !@get('isSaving')
  ).property('isDirty', 'isSaving')
