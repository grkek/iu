module Iu
  module Helper
    module Macros
      macro retrieve(key, type, application)
        {{application}}.get?({{key}}).as({{type}}).not_nil!
      end
    end
  end
end
