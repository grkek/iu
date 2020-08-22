require "../src/iu"

class WindowLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    window = create_window("Hello, World", {800, 600}, false)

    # Create a label and set it as the main child of the window
    window.child = create_label(
      "Everything can be sub-structured, the deeper you go the better it gets :)"
    )

    # Create a on_close handle for the current window
    window.on_close = ->(window : Iu::Ui::Window) {
      self.destroy(*{window, args.first})
    }

    # Render the window to the screen
    window.show
  end
end

app = Iu::Application.new
app.add_layer(WindowLayer.new)
app.start
