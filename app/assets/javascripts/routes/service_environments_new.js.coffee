App.ServiceEnvironmentsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    service = @modelFor('service')
    controller.set('fields', { serviceId: service.get('id') })
    controller.set('showError', false)
