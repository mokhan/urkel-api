App.ApplicationsRoute = Ember.Route.extend(
  model: ->
    @store.findAll('application')
)
