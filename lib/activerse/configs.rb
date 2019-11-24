module Activerse
  module Configs
    mattr_accessor :structure_file
    @@structure_file = 'structure.yml'

    mattr_accessor :after_page_actions
    @@after_page_actions = {}

    mattr_accessor :finalize_behaviour
    @@finalize_behaviour = :reload_routes

    def self.setup
      yield self
    end

  protected
    def self.after_page page, &block
      raise "Page must be a string" unless page.is_a? String
      @@after_page_actions[page] = block
    end
  end
end
