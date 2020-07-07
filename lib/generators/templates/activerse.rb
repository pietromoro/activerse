# frozen_string_literal: true

# This is the configuration file for activerse.
# In here you can customize some general configuration
# options as well as per page actions.
Activerse::Configs.setup do |config|
  # The structure file used by Activerse to create
  # the necessary pages. It's a YAML encoded file.
  config.structure_file = 'activerse_structure.yml'

  # Block that will be called in the context of a controller
  # before finalize_behaviour gets called and after all
  # credentials have been configured.
  # config.on_finalize
  #   # your code here
  # end

  # The behaviour that activerse should use when all
  # configurations have been set up.
  # Possible values are :reload_routes, :restart_server.
  config.finalize_behaviour = :reload_routes

  # Strip whitespaces from entered keys.
  config.strip_whitespaces = true

  # Configure at each page what should be done after
  # the keys of that page are configured.
  # The block gets called in the context of the block
  # and the variables of the blocks are the keys of
  # that particular page.
  # You can configure multiple ones.
  # config.after_page 'my_page' do |my_var1, my_var2|
  #   # code here
  # end
end
