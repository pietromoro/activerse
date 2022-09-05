require 'thor'

namespace :activerse do
  class Hammer < Thor
    include Thor::Actions
  end

  desc "Install Activerse gem"
  task :install do
    hammer :say, "Installing Activerse gem..."
    saving_method = hammer :ask, "Choose a saving method for your settings: [c]redentials or [d]atabase >:"
    if saving_method == "c"
      hammer :say, "Credentials saving method selected."
    elsif saving_method == "d"
      hammer :say, "Database saving method selected."
      Rake.application.invoke_task "activerse:install:migrations"
    else
      hammer :say, "Invalid option."
      return false
    end

    mode = hammer :ask, "Choose a mode: [t]erminal or [w]eb >: "
    if mode == "t"
      hammer :say, "Terminal mode chosen."
    elsif mode == "w"
      hammer :say, "Web mode chosen."
    else
      hammer :say, "Invalid option."
      return false
    end
  end

private
  def hammer *args
    Hammer.new.send(*args)
  end
end