module Activerse
  class Dsl
    def initialize(hash = {})
      @credentials = hash
      @current_keys = []
    end

  private
    def section title, sym = nil, &block
      guess = `tput cols`.to_i
      guess == 0 ? 80 : guess
      puts " #{title.to_s} ".center(guess, '=')
      @current_keys.push sym.nil? ? title.parameterize.underscore.to_sym : sym.to_sym
      instance_eval(&block)
      @current_keys.pop
      puts '-' * guess
    end

    def subsection name, &block
      @current_keys.push name.to_sym
      instance_eval(&block)
      @current_keys.pop
    end

    def set key, to: nil
      last = @current_keys.inject(@credentials) { |structure, s_key| structure[s_key] ||= {} }
      last[key.to_sym] = to
    end

    def get key
      last = @current_keys.inject(@credentials) { |structure, s_key| structure[s_key] ||= {} }
      last[key.to_sym]
    end
 
    def ask question, echo: true
      print question + " "
      if Activerse::Configs.strip_whitespaces
        return gets.chomp.strip
      else
        return gets.chomp
      end
    end

    def ask_and_set key, question, *args
      last = @current_keys.inject(@credentials) { |structure, s_key| structure[s_key] ||= {} }
      last_value = last[key.to_sym].nil? ? "" : last[key.to_sym]
      response = ask("#{question} (#{last_value})", *args)
      last[key.to_sym] = response.blank? ? last_value : response
    end

    def default key, to:
      set key, to: to if get(key).nil?
    end

    def save_to_database model, with: {}
      model.create!(with)
      set model.to_s.underscore.to_sym, to: true
    end
  end
end