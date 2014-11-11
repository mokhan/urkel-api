App.Failure = DS.Model.extend
  environment: DS.belongsTo('environment', async: true)
  message: DS.attr('string')
  hostname: DS.attr('string')
  error_type: DS.attr('string')
  backtrace: DS.attr('string')
