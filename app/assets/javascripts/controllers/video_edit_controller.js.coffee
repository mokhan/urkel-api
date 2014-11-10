App.VideoEditController = Ember.ObjectController.extend
  actions:
    saveChanges: ->
      @get('model').save() if @get('model.isDirty')
