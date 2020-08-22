require "../../src/iu"

class WindowLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    # #
    # Store the state into of the MainWindow into a Hash(String => Iu::Widget::Control)
    # #
    store(
      "MainWindow",
      create_window(title: "Control Gallery", dimensions: {800, 600}, menubar: true),
      args.first
    )
  end
end
