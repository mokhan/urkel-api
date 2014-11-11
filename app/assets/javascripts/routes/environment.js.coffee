App.EnvironmentRoute = Ember.Route.extend
  model: (params) ->
    @store.find('environment', params.environment_id)
