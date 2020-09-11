module Iu
  # :nodoc:
  module Component
    private getter control : Pointer(UI::Control)

    def initialize(control)
      @control = ui_control(control)
    end

    # Returns true if the control is currently visible
    def visible?
      UI.control_visible(self) > 0
    end

    # Shows the control
    def show
      UI.control_show(self)
    end

    # Hides the control
    def hide
      UI.control_hide(self)
    end

    # Returns true if the control is enabled
    def enabled?
      UI.control_enabled(self) > 0
    end

    # Enables the control
    def enable
      UI.control_enable(self)
    end

    # Disables the control
    def disable
      UI.control_disable(self)
    end

    # Destroys the control
    def destroy
      UI.control_destroy(self)
    end

    def to_unsafe
      self.control
    end

    def finalize
      self.destroy
    rescue
    end
  end
end
