App.ServicesController = Ember.ArrayController.extend
  sortProperties: ['name']

  services: (->
    if @get('search') then @get('searchResults') else @
  ).property('search', 'searchResults')

  searchResults: (->
    search = @get('search').toLowerCase()
    @filter (service) => service.get('name').toLowerCase().indexOf(search) != -1
  ).property('search', '@each.name')
