container = Spank::Container.new
container.register(:login_command) { |x| x.build(LoginCommand) }
container.register(:users) { |x| User }.as_singleton
Spank::IOC.bind_to(container)
