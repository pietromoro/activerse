module Activerse
  class Dsl
    def initialize(hash = {}, view_engine = nil, save_engine = nil)
      @structure = hash
      @current_keys = []
      @view_engine = view_engine
      @save_engine = save_engine
      @sections = []
      @current_section = nil 
    end

    def full_structure
      @structure
    end

  private # methods that compose the DSL
    def section title, sym = nil, &block
      raise "Section already defined" if @current_section
      raise "Section #{title} already defined" if @sections.include? title
      @sections << title
      @current_section = title

      @current_keys.push sym.nil? ? title.parameterize.underscore.to_sym : sym.to_sym
      @view_engine&.section&.call title
      instance_eval(&block)
      @current_keys.pop

      @current_section = nil
    end

    def subsection name, &block
      @current_keys.push name.to_sym
      @view_engine&.subsection&.call name
      instance_eval(&block)
      @current_keys.pop
    end

    def set key, to: nil
      @save_engine&.set&.call [@current_keys, key.to_sym].flatten, to
      last = @current_keys.inject(@structure) { |structure, s_key| structure[s_key] ||= {} }
      last[key.to_sym] = ""
    end

    def get key
      @save_engine&.get&.call [@current_keys, key.to_sym].flatten
    end

    def default key, to:
      set key, to: to
      last = @current_keys.inject(@structure) { |structure, s_key| structure[s_key] ||= {} }
      last[key.to_sym] = to
    end

    def ask question, echo: true
      @view_engine&.ask&.call question, echo
    end

    def ask_and_set key, question, *args
      last_value = get(key) || ""
      response = ask "#{question} (#{last_value})", *args
      set key, to: response if response.present? && !response.blank? && response != last_value
    end
  end
end