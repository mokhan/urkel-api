Mocode.VideosRoute = Ember.Route.extend({
  model: function() {
    return this.get('store').find('video');
    //return this.store.findAll('videos');
    //return this.get('store').findAll('video');
     //return Mocode.Video.find();
  }
});
