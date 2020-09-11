module Iu
  module Types
    # :nodoc:
    class DrawPath
      getter fill_mode : UI::DrawFillMode

      def initialize(@fill_mode : UI::DrawFillMode)
        @path = UI.new_draw_path(fill_mode)
      end

      def new_figure(x : Float64, y : Float64)
        UI.draw_path_new_figure(self, x, y)
      end

      def new_figure(xCenter : Float64,
                     yCenter : Float64,
                     radius : Float64,
                     startAngle : Float64,
                     sweep : Float64,
                     negative : LibC::Int)
        UI.draw_path_new_figure_with_arc(self, xCenter, yCenter, radius, startAngle, sweep, negative)
      end

      def line_to(x : Float64, y : Float64)
        UI.draw_path_line_to(self, x, y)
      end

      def arc_to(xCenter : Float64,
                 yCenter : Float64,
                 radius : Float64,
                 startAngle : Float64,
                 sweep : Float64,
                 negative : LibC::Int)
        UI.draw_path_arc_to(self, xCenter, yCenter, radius, startAngle, sweep, negative)
      end

      def bezier_to(c1x : Float64,
                    c1y : Float64,
                    c2x : Float64,
                    c2y : Float64,
                    endX : Float64,
                    endY : Float64)
        UI.draw_path_bezier_to(c1x, c1y, c2x, c2y, endX, endY)
      end

      def close_figure
        UI.draw_path_close_figure(self)
      end

      def add_rectangle(x : Float64, y : Float64, width : Float64, height : Float64)
        UI.draw_path_add_rectangle(self, x, y, width, height)
      end

      def end
        UI.draw_path_end(self)
      end

      def stroke(context : UI::DrawContext*,
                 brush : DrawBrush,
                 cap : UI::DrawLineCap = :flat,
                 join : UI::DrawLineJoin = :miter,
                 thickness : Float64 = 1.0,
                 miter_limit : Float64 = UI::DrawDefaultMiterLimit,
                 dashes : Float64 = 0.0,
                 num_dashes : Int32 = 0,
                 dash_phase : Float64 = 1.0)
        params = UI::DrawStrokeParams.new(cap: cap, join: join, thickness: thickness, miter_limit: miter_limit, dashes: dashes, num_dashes: num_dashes, dash_phase: dash_phase)
        UI.draw_path_stroke(context, self, brush, pointerof(params))
      end

      def fill(context : UI::DrawContext*, brush : DrawBrush)
        UI.draw_path_fill(context, self, brush)
      end

      def free
        UI.draw_free_path(@path)
      end

      def to_unsafe
        @path
      end

      def finalize
        self.free
      end
    end
  end
end
