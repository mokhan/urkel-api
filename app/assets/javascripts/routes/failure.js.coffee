App.FailureRoute = Ember.Route.extend
  model: (params) ->
    @store.find('failure', params.failure_id)
