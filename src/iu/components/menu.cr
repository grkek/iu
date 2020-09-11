module Iu
  module Components
    # :nodoc:
    class MenuItem
      def initialize(@menu_item : UI::MenuItem*)
      end

      # Enable the menu item.
      def enable
        UI.menu_item_enable(@menu_item)
      end

      # Disable the menu item.
      def disable
        UI.menu_item_disable(@menu_item)
      end
    end

    # :nodoc:
    class ClickableMenuItem < MenuItem
      Cute.signal clicked(window : Window)

      def initialize(menu_item)
        super(menu_item)
        set_on_clicked { |window| clicked.emit(window) }
      end

      @on_clicked_cb : Proc(Window, Nil)?

      private def set_on_clicked(&cb : Window ->)
        @on_clicked_cb = cb
        UI.menu_item_on_clicked @menu_item, ->(m, w, data) {
          win = Window.new(w)
          data.as(typeof(cb)*).value.call(win)
        }, pointerof(@on_clicked_cb)
      end
    end

    # :nodoc:
    class CheckableMenuItem < MenuItem
      def initialize(menu_item)
        super(menu_item)
      end

      # Returns true if the menu item is checked.
      def checked?
        UI.menu_item_checked(@menu_item) > 0
      end

      # Set whether the menu item is checked.
      def checked=(value : Bool)
        UI.menu_item_set_checked(@menu_item, value)
      end
    end

    # :nodoc:
    class Menu
      def initialize(name : String)
        @menu = UI.new_menu(name)
      end

      def append_item(name : String)
        ClickableMenuItem.new(UI.menu_append_item(@menu, name))
      end

      def append_check_item(name : String)
        CheckableMenuItem.new(UI.menu_append_check_item(@menu, name))
      end

      def append_quit_item
        MenuItem.new(UI.menu_append_quit_item(@menu))
      end

      def append_preferences_item
        ClickableMenuItem.new(UI.menu_append_preferences_item(@menu))
      end

      def append_about_item
        ClickableMenuItem.new(UI.menu_append_about_item(@menu))
      end

      def append_separator
        UI.menu_append_separator(@menu)
      end
    end
  end
end
