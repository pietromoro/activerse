module Activerse
  class Dsl
    def initialize(hash = {})
      @@credentials = hash
      @@current_keys = []
    end

  private
    def section title, sym = nil, &block
      guess = `tput cols`.to_i
      guess == 0 ? 80 : guess
      puts title.to_s.center(guess, '=')
      @@current_keys.push sym.nil? ? title.to_sym : sym.to_sym
      instance_eval(&block)
      @@current_keys.pop
      puts '-' * guess + '\n'
    end

    def subsection name, &block
      @@current_keys.push name.to_sym
      instance_eval(&block)
      @@current_keys.pop
    end

    def set key, to: nil
      keys = (@@current_keys << key.to_sym)
      last = keys.inject(@@credentials) { |structure, key| structure[key] ||= {} }
      last[keys.last] = to
    end
 
    def ask question, echo: true
      print question
      gets
    end
  end
end