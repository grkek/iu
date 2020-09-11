module Iu
  module Components
    # :nodoc:
    class HorizontalSeparator
      include Component

      def initialize
        @separator = UI.new_horizontal_separator
        super(@separator)
      end
    end

    # :nodoc:
    class VerticalSeparator
      include Component

      def initialize
        @separator = UI.new_vertical_separator
        super(@separator)
      end
    end
  end
end
