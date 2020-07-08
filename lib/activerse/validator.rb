module Activerse
  class Validator
    def initialize input
      @input = input
      check_validity
    end

    def check_validity
      # TODO: validate structure file schema
    end

    def name
      @input.dig(:name)
    end

    def pages
      @input.dig(:pages)
    end

    def fields_for page_name
      @input.dig(:pages).each do |page|
        next unless page.dig(:name) == page_name
        return page.dig(:fields)
      end
    end
  end
end
