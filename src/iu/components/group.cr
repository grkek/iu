module Iu
  module Components
    # :nodoc:
    class Group
      include Component

      def initialize(title : String, margined : Bool = false)
        @group = UI.new_group(title)
        super(@group)
        self.margined = margined
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

      def adopt(component : Component | ReusableComponent)
        if component.is_a?(ReusableComponent)
          self.child = component.render
        else
          self.child = component
        end

        self
      end
    end
  end
end
