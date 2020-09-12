module ControlGallery
  # :nodoc:
  class NumbersComponent < Iu::ReusableComponent
    include Iu::Components

    def initialize
      @spinbox = Spinbox.new(0, 100)
      @slider = Slider.new(0, 100)
      @progress_bar = ProgressBar.new

      @spinbox.changed.on do
        value = @spinbox.value.to_i
        @slider.value = value
        @progress_bar.value = value
      end

      @slider.changed.on do
        value = @slider.value.to_i
        @spinbox.value = value
        @progress_bar.value = value
      end
    end

    def render : Iu::Component
      VerticalBox
        .new(padded: true)
        .adopt(
          Group
            .new(title: "Numbers", margined: true)
            .adopt(
              VerticalBox
                .new(padded: true)
                .adopt(
                  @spinbox
                )
                .adopt(
                  @slider
                )
                .adopt(
                  @progress_bar
                )
            )
        )
    end
  end
end
