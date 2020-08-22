require "../../src/iu"

class UiLayer < Iu::Abstractions::Layer
  def create(*args, **kwargs)
    # Get the main window from the storage
    window = retrieve("MainWindow", Iu::Ui::Window, args.first)

    # Get everything else that is needed
    main_vertical_box = retrieve("MainVerticalBox", Iu::Ui::VerticalBox, args.first)
    main_horizontal_box = retrieve("MainHorizontalBox", Iu::Ui::HorizontalBox, args.first)
    inner_main_vertical_box = retrieve("InnerMainVerticalBox", Iu::Ui::VerticalBox, args.first)
    inner_main_vertical_box_two = retrieve("InnerMainVerticalBoxTwo", Iu::Ui::VerticalBox, args.first)
    inner_main_vertical_box_three = retrieve("InnerMainVerticalBoxThree", Iu::Ui::VerticalBox, args.first)
    inner_main_vertical_box_four = retrieve("InnerMainVerticalBoxFour", Iu::Ui::VerticalBox, args.first)
    basic_controls_group = retrieve("BasicControlsGroup", Iu::Ui::Group, args.first)
    numbers_group = retrieve("NumbersGroup", Iu::Ui::Group, args.first)
    lists_group = retrieve("ListsGroup", Iu::Ui::Group, args.first)

    window.child = main_vertical_box
    main_vertical_box.push(main_horizontal_box)
    main_horizontal_box.push(basic_controls_group)

    basic_controls_group.child = inner_main_vertical_box

    # Create a lot of controls
    inner_main_vertical_box.push(
      create_button("Button"),
      create_check_box("Checkbox"),
      create_entry(),
      create_label("Label"),
      create_horizontal_separator(),
      create_date_picker(),
      create_time_picker(),
      create_date_time_picker(),
      create_font_button(),
      create_color_button()
    )

    main_horizontal_box.push(inner_main_vertical_box_two)
    inner_main_vertical_box_two.push(numbers_group)

    numbers_group.child = inner_main_vertical_box_three
    spinbox = create_spinbox({0, 100})
    slider = create_slider({0, 100})
    progress_bar = create_progress_bar()

    inner_main_vertical_box_three.push(spinbox)
    inner_main_vertical_box_three.push(slider)
    inner_main_vertical_box_three.push(progress_bar)
    inner_main_vertical_box_two.push(lists_group)

    lists_group.child = inner_main_vertical_box_four

    combo_box = create_combo_box()
    combo_box.choices = ["Combobox Item 1", "Combobox Item 2", "Combobox Item 3"]

    editable_combo_box = create_editable_combo_box()
    editable_combo_box.choices = ["Editable Item 1", "Editable Item 2", "Editable Item 3"]

    radio_button = create_radio_buttons()
    radio_button.choices = ["Radio Button 1", "Radio Button 2", "Radio Button 3"]
    radio_button.stretchy = true

    inner_main_vertical_box_four.push(combo_box)
    inner_main_vertical_box_four.push(editable_combo_box)
    inner_main_vertical_box_four.push(radio_button)

    tab = create_tab()
    tab["Page 1"] = create_horizontal_box()
    tab["Page 2"] = create_horizontal_box()
    tab["Page 3"] = create_horizontal_box()
    tab.stretchy = true

    inner_main_vertical_box_two.push(tab)

    store("Spinbox", spinbox, args.first)
    store("Slider", slider, args.first)
    store("ProgressBar", progress_bar, args.first)
  end
end
