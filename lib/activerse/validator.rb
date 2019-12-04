module Activerse
  class Validator
    def initialize input
      @input = input
      check_validity
    end

    def check_validity
      raise "Attribute 'name' not found" if @input.dig(:name).nil?
      raise "Attribute 'pages' not found" if @input.dig(:pages).nil?
      raise "Attribute 'pages' must be an Array" unless @input.dig(:pages).is_a?(Array)
      @input.dig(:pages).each do |page|
        raise "Each page must be contain a name and a fields attribute" unless page.is_a?(Hash)
        raise "Attribute 'name' not found for page" if page.dig(:name).nil?
        raise "Attribute 'name' should be a String" unless page.dig(:name).is_a?(String)
        raise "Attribute 'fields' not found for page #{page.dig(:name)}" if page.dig(:fields).nil?
        raise "Attribute 'fields' for page #{page.dig(:name)} should be an Array" unless page.dig(:fields).is_a?(Array)
        page.dig(:fields).each do |field|
          raise "Attribute should be an Hash" unless field.is_a?(Hash)
        end
      end
    end

    def name
      @input.dig(:name)
    end

    def pages
      @input.dig(:pages)
    end

    def fields_for page
      @input.dig(:pages).each do |page|
        next unless page.dig(:name) == page
        return page.dig(:fields)
      end
    end
  end
end
