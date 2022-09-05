module Activerse
  module Renderer
    class BaseRenderer
      def initialize()
      end

      def section title
        raise "Not implemented"
      end

      def subsection name
        raise "Not implemented"
      end

      def ask question, echo: true
        raise "Not implemented"
      end
    end
  end
end