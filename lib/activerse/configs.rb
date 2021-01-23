module Activerse
  module Configs
    mattr_accessor :finalize_behaviour
    @@finalize_behaviour = :restart_server

    mattr_accessor :strip_whitespaces
    @@strip_whitespaces = true

    def self.setup
      yield self
    end

    mattr_reader :internal_structure
    def self.credentials(&block)
      @@internal_structure = block
    end
  end
end
