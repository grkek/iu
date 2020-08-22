require "../../src/iu"

class MenuLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    # Create the top level menu entries with which we can expand the list.
    file = create_menu("File")
    edit = create_menu("Edit")
    help = create_menu("Help")

    # Create menu items and add the quit button with a pre-defined trigger to call the on_quit proc.
    create_menu_item(file, "Open")
    create_menu_item(file, "Save")
    file.add_quit

    # Create a checkable item for the menu.
    create_menu_checkableitem(edit, "Checkable item")
    edit.add_separator

    create_menu_item(edit, "Disabled item").disable
    edit.add_preferences

    create_menu_item(help, "Help")
    help.add_about
  end
end
