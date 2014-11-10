App.ServiceRoute = Ember.Route.extend
  model: (params) -> @store.find('service', params.service_id)
