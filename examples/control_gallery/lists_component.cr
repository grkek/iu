module ControlGallery
  # :nodoc:
  class ListsComponent < Iu::ReusableComponent
    include Iu::Components

    def render : Iu::Component
      VerticalBox
        .new(padded: true)
        .adopt(
          Group
            .new(title: "Lists", margined: true)
            .adopt(
              VerticalBox
                .new(padded: true)
                .adopt(
                  ComboBox
                    .new(["Combobox Item 1", "Combobox Item 2", "Combobox Item 3"])
                )
                .adopt(
                  EditableComboBox
                    .new(["Editable Item 1", "Editable Item 2", "Editable Item 3"])
                )
                .adopt(
                  RadioButtons
                    .new(["Radio Button 1", "Radio Button 2", "Radio Button 3"])
                )
                .adopt(
                  Tab
                    .new
                    .adopt(component: BasicControlsComponent.new, title: "Page 1", margined: true)
                    .adopt(component: NumbersComponent.new, title: "Page 2", margined: true)
                    .adopt(component: HorizontalBox.new, title: "Page 3", margined: true),
                  stretchy: true
                )
            )
        )
    end
  end
end
