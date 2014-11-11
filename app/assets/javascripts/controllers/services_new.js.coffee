App.ServicesNewController = Ember.Controller.extend
  actions:
    createService: ->
      fields = @get('fields')
      if App.Service.valid(fields)
        service = @store.createRecord('service', @get('fields'))
        service.save().then =>
          @transitionTo('services')
      else
        @set('showError', true)
