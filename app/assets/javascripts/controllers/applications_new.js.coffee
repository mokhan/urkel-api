App.ApplicationsNewController = Ember.Controller.extend
  actions:
    createApplication: ->
      fields = @get('fields')
      if App.Application.valid(fields)
        application = @store.createRecord('application', @get('fields'))
        application.save().then =>
          @transitionTo('application', application)
      else
        @set('showError', true)
