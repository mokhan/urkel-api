App.ServicesRoute = Ember.Route.extend(
  model: ->
    @store.findAll('service')
)
