module Example
  # :nodoc:
  class UserInterfaceLayer < Iu::Abstractions::Layer
    def create(**kwargs)
      hbox = kwargs
        .["parent"]
        .horizontal_box

      inner = kwargs
        .["parent"]
        .inner_vertical_box

      inner2 = kwargs
        .["parent"]
        .inner_vertical_box_two

      group = Group.new "Basic Controls"
      group.margined = true
      hbox.append group
      group.child = inner

      button = Button.new("Button")

      button.clicked.on do
        puts "I was clicked!"
      end

      inner.append button
      inner.append Checkbox.new("Checkbox")
      entry = Entry.new
      entry.text = "Entry"

      entry.changed.on do
        puts entry.text
      end

      inner.append entry
      inner.append Label.new("Label")

      inner.append HorizontalSeparator.new

      inner.append DatePicker.new
      inner.append TimePicker.new
      inner.append DateTimePicker.new

      inner.append FontButton.new
      inner.append ColorButton.new

      hbox.append inner2, true

      group = Group.new "Numbers"
      group.margined = true
      inner2.append group

      inner = VerticalBox.new
      inner.padded = true
      group.child = inner

      progress_bar = ProgressBar.new
      spinbox = Spinbox.new 0, 100
      slider = Slider.new 0, 100

      spinbox.changed.on do
        value = spinbox.value.to_i
        slider.value = value
        progress_bar.value = value
      end

      slider.changed.on do
        value = slider.value.to_i
        spinbox.value = value
        progress_bar.value = value
      end

      inner.append spinbox
      inner.append slider
      inner.append progress_bar

      group = Group.new "Lists"
      group.margined = true
      inner2.append group

      inner = VerticalBox.new
      inner.padded = true
      group.child = inner

      cbox = ComboBox.new([
        "Item 1",
        "Item 2",
        "Item 3",
      ])
      inner.append cbox

      ecbox = EditableComboBox.new([
        "Item 1",
        "Item 2",
        "Item 3",
      ])
      inner.append ecbox

      rb = RadioButtons.new([
        "Button 1",
        "Button 2",
        "Button 3",
      ])
      inner.append rb, true

      tab = Tab.new
      tab.append "Page 1", HorizontalBox.new
      tab.append "Page 2", HorizontalBox.new
      tab.append "Page 3", HorizontalBox.new
      inner2.append tab, true
    end

    def destroy(**kwargs)
      exit(0)
    end
  end
end
