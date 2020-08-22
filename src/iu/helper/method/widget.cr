require "../../ui/*"
require "../../widget/*"
require "../../application.cr"

module Iu::Helper::Methods
  def create_window(title : String, dimensions : Tuple, menubar : Bool)
    Iu::Ui::Window.new(title, dimensions, menubar)
  end

  def create_menu(name : String)
    Iu::Menu::Menu.new(name)
  end

  def create_menu_item(menu : Iu::Menu::Menu, name : String)
    Iu::Menu::MenuItem.new(menu, name)
  end

  def create_menu_checkableitem(menu : Iu::Menu::Menu, name : String)
    Iu::Menu::MenuCheckItem.new(menu, name)
  end

  def create_vertical_box
    Iu::Ui::VerticalBox.new
  end

  def create_horizontal_box
    Iu::Ui::HorizontalBox.new
  end

  def create_group(title : String)
    Iu::Ui::Group.new(title)
  end

  def create_radio_buttons
    Iu::Ui::RadioButtons.new
  end

  def create_editable_combo_box
    Iu::Ui::EditableCombobox.new
  end

  def create_combo_box
    Iu::Ui::Combobox.new
  end

  def create_tab
    Iu::Ui::Tab.new
  end

  def create_progress_bar
    Iu::Ui::ProgressBar.new
  end

  def create_slider(bounds : Tuple)
    Iu::Ui::Slider.new(bounds)
  end

  def create_spinbox(bounds : Tuple)
    Iu::Ui::Spinbox.new(bounds)
  end

  def create_button(text : String)
    Iu::Ui::Button.new(text)
  end

  def create_check_box(text : String)
    Iu::Ui::Checkbox.new(text)
  end

  def create_entry
    Iu::Ui::Entry.new
  end

  def create_label(text : String)
    Iu::Ui::Label.new(text)
  end

  def create_horizontal_separator
    Iu::Ui::HorizontalSeparator.new
  end

  def create_date_picker
    Iu::Ui::DatePicker.new
  end

  def create_time_picker
    Iu::Ui::TimePicker.new
  end

  def create_date_time_picker
    Iu::Ui::DateTimePicker.new
  end

  def create_font_button
    Iu::Ui::FontButton.new
  end

  def create_color_button
    Iu::Ui::ColorButton.new
  end
end
