App.VideoEditRoute = Ember.Route.extend
  activate: -> @controllerFor('video').set('isEditing', true)
  deactivate: -> @controllerFor('video').set('isEditing', false)
