container = Spank::Container.new
container.register(:login_command) do |builder|
  LoginCommand.new(User)
end
Spank::IOC.bind_to(container)
