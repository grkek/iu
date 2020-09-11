require "../src/iu"
require "./control_gallery/**"

# :nodoc:
module Example
  include Iu::Types
  include Iu::Components

  # :nodoc:
  class Application < Iu::Application
    def initialize_component
      # Menu layer must be created before the `Window` component
      # since it needs to finalize building the menu's to apply it to the `Window` component.
      menu_layer = MenuLayer.new
      window_layer = WindowLayer.new

      window_layer
        .attach(BoxLayer.new)
        .attach(UserInterfaceLayer.new)

      window_layer.create
    end

    def uninitialze_component
    end
  end
end

app = Example::Application.new
app.start
