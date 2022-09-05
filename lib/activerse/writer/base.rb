module Activerse
  module Writer
    class BaseWriter
      def initialize
      end

      def set keys, value
        raise "Not implemented"
      end

      def get keys, value
        raise "Not implemented"
      end
    end
  end
end