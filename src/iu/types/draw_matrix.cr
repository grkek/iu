module Iu
  module Types
    # :nodoc:
    class DrawMatrix
      def initialize
        @matrix = uninitialized UI::DrawMatrix
        UI.draw_matrix_set_identity(pointerof(@matrix))
      end

      def translate(x, y)
        UI.draw_matrix_translate(self, x.to_f, y.to_f)
      end

      def scale(x_center, y_center, x, y)
        UI.draw_matrix_scale(self, x_center, y_center, x, y)
      end

      def rotate(x, y, amount)
        UI.draw_matrix_rotate(self, x.to_f, y.to_f, amount.to_f)
      end

      def skew(x, y, x_amount, y_amount)
        UI.draw_matrix_skew(self, x.to_f, y.to_f, x_amount.to_f, y_amount.to_f)
      end

      def multiply(other : DrawMatrix)
        UI.draw_matrix_multiply(self, other)
      end

      def invertible?
        UI.draw_matrix_invertible(self) > 0
      end

      def invert
        UI.draw_matrix_invert(self) > 0
      end

      def transform_point(x, y)
        UI.draw_matrix_transform_point(self, x.to_f, y.to_f)
      end

      def transform_size(x, y)
        UI.draw_matrix_transform_size(self, x.to_f, y.to_f)
      end

      def transform(context : UI::DrawContext*)
        UI.draw_transform(context, self)
      end

      def to_unsafe
        pointerof(@matrix)
      end
    end
  end
end
