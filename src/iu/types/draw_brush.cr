module Iu
  module Types
    # :nodoc:
    class DrawBrush
      def initialize(color : Int32, alpha : Float64 = 1.0)
        @brush = UI::DrawBrush.new
        set_solid_brush(color, alpha)
      end

      def color=(color : Int32)
        set_solid_brush(color, self.a)
      end

      def type
        @brush.type
      end

      def type=(value : UI::DrawBrushType)
        @brush.type = value
      end

      def r
        @brush.r
      end

      def r=(value : Float64)
        @brush.r = value
      end

      def g
        @brush.g
      end

      def g=(value : Float64)
        @brush.g = value
      end

      def b
        @brush.b
      end

      def b=(value : Float64)
        @brush.b = value
      end

      def a
        @brush.a
      end

      def a=(value : Float64)
        @brush.a = value
      end

      def x0
        @brush.x0
      end

      def x0=(value : Float64)
        @brush.x0 = value
      end

      def x1
        @brush.x1
      end

      def x1=(value : Float64)
        @brush.x1 = value
      end

      def y0
        @brush.y0
      end

      def y0=(value : Float64)
        @brush.y0 = value
      end

      def y1
        @brush.y1
      end

      def y1=(value : Float64)
        @brush.y1 = value
      end

      def outer_radius
        @brush.outer_radius
      end

      def outer_radius=(value : Float64)
        @brush.outer_radius = value
      end

      def stops
        @brush.stops.value
      end

      def stops=(value : UI::DrawBrushGradientStop)
        @brush.stops = pointerof(value)
      end

      def num_stops
        @brush.num_stops
      end

      def num_stops=(value : Int32)
        @brush.num_stops = value
      end

      def to_unsafe
        pointerof(@brush)
      end

      # :nodoc:
      private def set_solid_brush(color, alpha)
        component = 0_u8
        @brush.type = UI::DrawBrushType::Solid
        component = ((color >> 16) & 0xFF).to_u8
        @brush.r = component.to_f64 / 255
        component = ((color >> 8) & 0xFF).to_u8
        @brush.g = component.to_f64 / 255
        component = (color & 0xFF).to_u8
        @brush.b = component.to_f64 / 255
        @brush.a = alpha
      end
    end
  end
end
