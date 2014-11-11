json.environment do
  json.id @environment.id
  json.name @environment.name
  json.apiKey @environment.api_key
  json.service @environment.service.id
end
