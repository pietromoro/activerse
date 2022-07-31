module Activerse
  class << self
    attr_reader :config

    def setup
      @config ||= Config.new
      yield @config
    end
  end

  class Config
  private
    def self.accept name, values, default: nil
      attr_reader name
      define_method "#{name}=" do |value|
        raise "Invalid value for #{name}: #{value}" unless values.include? value
        instance_variable_set("@#{name}", value)
      end

      @@configs ||= {}
      @@configs[name] = default
    end

  public
    accept :strip_whitespaces, [true, false], default: true
    accept :finalize_behaviour, [:nothing, :restart_server, :reload_routes], default: :nothing
    accept :saving_method, [:credentials, :database], default: :credentials
    accept :ui_mode, [:terminal, :web], default: :terminal
    
    attr_reader :internal_structure
    def credentials(&block)
      @internal_structure = block
    end

    def initialize
      @@configs.keys.each do |config|
        send("#{config}=", @@configs[config])
      end

      @internal_structure ||= {}
    end
  end
end