module Iu
  module Components
    # :nodoc:
    class Tab
      include Component

      def initialize
        @tab = UI.new_tab
        super(@tab)
      end

      # Appends a child to the tab.
      def append(name : String, component : Component)
        UI.tab_append(@tab, name, component)
      end

      def insert(name, index, component)
        UI.tab_insert_at(@tab, name, index, component)
      end

      # Delete a child from the tab.
      def delete(index)
        UI.tab_delete(@tab, index)
      end

      # Returns true if this tab is margined.
      def margined?
        UI.tab_margined(@tab)
      end

      # Sets whether this tab is margined.
      def margined(value : Bool, index : UInt64)
        UI.tab_set_margined(@tab, index, value)
      end

      def pages
        UI.tab_num_pages(@tab)
      end

      def adopt(component : Component | ReusableComponent, title : String, margined : Bool = false)
        if component.is_a?(ReusableComponent)
          self.append(title, component.render)
          self.margined(margined, self.pages - 1)
        else
          self.margined(margined, self.pages - 1)
          self.append(title, component)
        end

        self
      end
    end
  end
end
