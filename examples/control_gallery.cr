require "../src/iu"

require "./control_gallery/**"

# :nodoc:
module ControlGallery
  # Define a global component storage
  COMPONENTS = {} of String => Iu::Component

  # :nodoc:
  class Application < Iu::Application
    include Iu::Components

    def initialize_component
      # Menn bar for the application
      file_menu = Menu.new "File"
      open_item = file_menu.append_item "Open"
      save_item = file_menu.append_item "Save"
      file_menu.append_quit_item

      edit_meu = Menu.new "Edit"
      edit_meu.append_check_item "Checkable Item"
      disabled_item = edit_meu.append_item "Disabled Item"
      disabled_item.disable
      edit_meu.append_preferences_item

      help_menu = Menu.new "Help"
      help_menu.append_item "Help"
      help_menu.append_about_item

      window =
        Iu::Components::Window.new(
          title: "Control gallery",
          width: 1200,
          height: 600,
          menu_bar: true
        )

      COMPONENTS["MainWindow"] = window

      window.margined = true

      window
        .adopt(
          VerticalBox
            .new(padded: true)
            .adopt(
              HorizontalBox
                .new(padded: true)
                .adopt(
                  BasicControlsComponent.new,
                  stretchy: true
                )
                .adopt(
                  VerticalBox
                    .new(padded: true)
                    .adopt(
                      NumbersComponent.new,
                    )
                    .adopt(
                      ListsComponent.new
                    ),
                  stretchy: true
                ),
                stretchy: true
            )
        )

      window.closing.on do
        exit(0)
      end

      window.show
    end
  end
end

app = ControlGallery::Application.new

app.should_quit.on do
  exit(0)
end

app.start
