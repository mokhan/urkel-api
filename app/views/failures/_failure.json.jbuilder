json.id failure.id
json.message failure.message
json.hostname failure.hostname
json.error_type failure.error_type
json.backtrace failure.try(:backtrace).try(:join, ' ')
json.environment failure.environment.id
