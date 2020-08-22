require "../../ui/*"
require "../../application.cr"

module Iu::Helper::Macros
  macro retrieve(key, type, application)
    {{application}}.get?({{key}}).as({{type}}).not_nil!
  end
end
