App.VideoRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('video', params.video_id);
  },
  serialize: function(post) {
    return { post_id: post.get('id') };
  }
});
