App.ServiceController = Ember.ObjectController.extend
  actions:
    deleteService: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute('services')
