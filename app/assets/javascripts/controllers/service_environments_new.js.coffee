App.ServiceEnvironmentsNewController = Ember.Controller.extend
  actions:
    createEnvironment: ->
      fields = @get('fields')
      if App.Environment.valid(fields)
        environment = @store.createRecord('environment', @get('fields'))
        serviceId = @get('fields')['serviceId']
        service = @store.find('service', serviceId).then (service) =>
          environment.set('service', service)
          environment.save().then =>
            @transitionTo('environment', environment)
      else
        @set('showError', true)
