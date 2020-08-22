require "../../ui/*"
require "../../widget/*"
require "../../application.cr"

module Iu::Helper::Methods
  def store(key : String, value : Iu::Widget::Control, application : Iu::Application)
    application.set(key, value)
  end
end
