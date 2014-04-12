App.ApplicationRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('title', "Hello world!");
  }
});
