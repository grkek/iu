require "../../src/iu"

class FunctionLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    window = retrieve("MainWindow", Iu::Ui::Window, args.first)
    spinbox = retrieve("Spinbox", Iu::Ui::Spinbox, args.first)
    slider = retrieve("Slider", Iu::Ui::Slider, args.first)
    progress_bar = retrieve("ProgressBar", Iu::Ui::ProgressBar, args.first)

    window.on_close = ->(window : Iu::Ui::Window) {
      self.destroy(*{window, args.first})
    }

    args.first.on_stop do
      destroy(*{window, args.first})
    end

    spinbox.on_change = ->(spinbox : Iu::Ui::Spinbox) {
      value = spinbox.value
      slider.value = value
      progress_bar.value = value
    }

    slider.on_change = ->(slider : Iu::Ui::Slider) {
      value = slider.value
      spinbox.value = value
      progress_bar.value = value
    }

    # Use the storage for debugging anything libui pointer error related
    # p args.first.storage
    # It contains all of the elements which are shared across the classes.

    # Create the application window.
    window.show
  end
end
