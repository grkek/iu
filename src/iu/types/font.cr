module Iu
  module Types
    # :nodoc:
    record Font, family : String,
      size : Float64,
      weight : UI::TextWeight,
      italic : UI::TextItalic,
      stretch : UI::TextStretch do
      def self.from_descriptor(d : UI::FontDescriptor)
        font = new(String.new(d.family),
          d.weight.to_f64,
          d.weight,
          d.italic,
          d.stretch)
        UI.free_font_button_font(pointerof(d))
        font
      end
    end
  end
end
