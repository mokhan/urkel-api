App.ServiceEditRoute = Ember.Route.extend
  activate: -> @controllerFor('service').set('isEditing', true)
  deactivate: -> @controllerFor('service').set('isEditing', false)
