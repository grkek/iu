module ControlGallery
  # :nodoc:
  class BasicControlsComponent < Iu::ReusableComponent
    include Iu::Components

    def initialize
      @button = Button.new("Button")

      @button.clicked.on do
        UI.msg_box(COMPONENTS["MainWindow"].as(Window).window, "Good Job!", "You have clicked a button!")
      end

      @entry = Entry.new
      @entry.text = "Please do not edit me!"

      @entry.changed.on do
        UI.msg_box_error(COMPONENTS["MainWindow"].as(Window).window, ">:(", "Why did you edit me?")        
      end
    end

    def render : Iu::Component
      Group
        .new(title: "Basic controls", margined: true)
        .adopt(
          VerticalBox
            .new(padded: true)
            .adopt(
              @button
            )
            .adopt(
              Checkbox.new("Checkbox")
            )
            .adopt(
              @entry
            )
            .adopt(
              Label.new("Label")
            )
            .adopt(
              HorizontalSeparator.new
            )
            .adopt(
              DatePicker.new
            )
            .adopt(
              TimePicker.new
            )
            .adopt(
              DateTimePicker.new
            )
            .adopt(
              FontButton.new
            )
            .adopt(
              ColorButton.new
            )
        )
    end
  end
end
