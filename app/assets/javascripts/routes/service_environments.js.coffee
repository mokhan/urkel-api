App.ServiceEnvironmentsRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('service').get('environments')
