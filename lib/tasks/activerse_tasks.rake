namespace :activerse do
  desc "Install Activerse Gem"
  task :install do
    puts "Installing Activerse..."
    Rake.application.invoke_task("activerse:install:migrations")
  end
end
