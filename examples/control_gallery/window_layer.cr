module Example
  # :nodoc:
  class WindowLayer < Iu::Abstractions::Layer
    property window : Window

    def initialize
      @window = Window.new(
        "Control gallery",
        800,
        600,
        true
      )
    end

    def create(**kwargs)
      @window.closing.on do
        destroy
      end

      @window.margined = true
      @window.show
    end

    def destroy(**kwargs)
      exit(0)
    end
  end
end
