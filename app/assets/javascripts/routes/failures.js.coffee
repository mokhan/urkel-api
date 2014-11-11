App.FailuresRoute = Ember.Route.extend
  model: ->
    @store.findAll('failure')
