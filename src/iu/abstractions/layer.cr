module Iu
  module Abstractions
    abstract class Layer < Observer
      include Iu::Helper::Macros
      include Iu::Helper::Methods

      abstract def create(*args, **kwargs)

      def destroy(*args, **kwargs)
        args.each do |arg|
          if arg.is_a?(Iu::Widget::Control)
            arg.destroy
          elsif arg.is_a?(Iu::Application)
            arg.stop
          end
        end
      end

      def throw(ex : Exception)
        raise ex
      end
    end
  end
end
