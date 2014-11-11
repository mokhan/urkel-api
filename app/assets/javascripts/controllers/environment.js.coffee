App.EnvironmentController = Ember.ObjectController.extend
  actions:
    deleteEnvironment: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute('service.environments')
