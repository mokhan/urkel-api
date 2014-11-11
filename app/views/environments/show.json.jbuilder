json.environment do
  json.id @environment.id
  json.name @environment.name
  json.service @environment.service.id
end
