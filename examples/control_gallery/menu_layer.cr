module Example
  # :nodoc:
  class MenuLayer
    def initialize
      file_menu = Menu.new "File"

      open_item = file_menu.append_item "Open"
      open_item.clicked.on do |window|
        filename = window.open_file
        if !filename
          window.show_error("No file selected!", "This is an error.")
        else
          window.show_message("File selected", filename)
        end
      end

      save_item = file_menu.append_item "Save"
      save_item.clicked.on do |window|
        filename = window.save_file
        if !filename
          window.show_error("No file selected!", "This is an error.")
        else
          window.show_message("File selected", filename)
        end
      end

      file_menu.append_quit_item

      edit_meu = Menu.new "Edit"
      edit_meu.append_check_item "Checkable Item"
      disabled_item = edit_meu.append_item "Disabled Item"
      disabled_item.disable
      edit_meu.append_preferences_item

      help_menu = Menu.new "Help"
      help_menu.append_item "Help"
      help_menu.append_about_item
    end
  end
end
