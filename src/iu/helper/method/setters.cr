module Iu
  module Helper
    module Methods
      def store(key : String, value : Iu::Widget::Control, application : Iu::Application)
        application.set(key, value)
      end
    end
  end
end
