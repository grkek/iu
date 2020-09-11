module Iu
  module Components
    # :nodoc:
    class Group
      include Component

      def initialize(title : String)
        @group = UI.new_group(title)
        super(@group)
      end

      def title
        String.new(UI.group_title(@group))
      end

      def title=(value : String)
        UI.group_set_title(@group, value)
      end

      def child=(value : Component)
        UI.group_set_child(@group, value)
      end

      def margined?
        UI.group_margined(@group) > 0
      end

      def margined=(value : Bool)
        UI.group_set_margined(@group, value)
      end
    end
  end
end
