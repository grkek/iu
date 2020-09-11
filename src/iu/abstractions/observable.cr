module Iu
  module Abstractions
    # :nodoc:
    module Observable(T)
      getter observers

      def add_layer(observer : Observer)
        @observers ||= [] of T
        @observers.not_nil! << observer
      end

      def delete_layer(observer)
        @observers.try &.delete(observer)
      end
    end
  end
end
