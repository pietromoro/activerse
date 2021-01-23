# frozen_string_literal: true

# This is the configuration file for activerse.
# In here you can customize some general configuration
# options as well as per page actions.
Activerse::Configs.setup do |config|

  # Block that will be called in the context of a controller
  # before finalize_behaviour gets called and after all
  # credentials have been configured.
  # config.on_finalize
  #   # your code here
  # end

  # The behaviour that activerse should use when all
  # configurations have been set up.
  # Possible values are :reload_routes, :restart_server.
  config.finalize_behaviour = :restart_server

  # Strip whitespaces from entered values.
  config.strip_whitespaces = true

  # Configure the structure of the credentials file
  # with the custom DLS.
  config.credentials do
    # code here
  end
end
