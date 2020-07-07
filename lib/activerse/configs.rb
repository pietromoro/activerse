module Activerse
  module Configs
    mattr_accessor :structure_file
    @@structure_file = 'activerse_structure.yml'

    mattr_reader :after_page_actions
    @@after_page_actions = {}

    mattr_accessor :finalize_behaviour
    @@finalize_behaviour = :reload_routes

    mattr_accessor :strip_whitespaces
    @@strip_whitespaces = true

    def self.setup
      yield self
    end

    def self.after_page page, &block
      raise "Page must be a string" unless page.is_a? String
      @@after_page_actions[page] = block
    end

    def self.on_finalize &block
      @@finalize = block
    end
    mattr_reader :finalize
  end
end
