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

    def self.after_page page, &block
      raise "Page must be a string" unless page.is_a? String
      @@after_page_actions[page] = block
    end

    def self.on_finalize &block
      @@on_finalize = block
    end
    mattr_reader :on_finalize
  end
end
