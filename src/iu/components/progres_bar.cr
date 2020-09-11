module Iu
  module Components
    # :nodoc:
    class ProgressBar
      include Component

      def initialize(initial_value = 0)
        @progress_bar = UI.new_progress_bar
        super(@progress_bar)
        self.value = initial_value
      end

      def value=(value : Int32)
        UI.progress_bar_set_value(@progress_bar, value)
      end

      def value
        UI.progress_bar_value(@progress_bar)
      end
    end
  end
end
