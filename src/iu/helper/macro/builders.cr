require "../../ui/*"

module Iu::Helper::Macros
  macro strap(type, kwargs)
    {{type}}.new({{kwargs}}).not_nil!
  end

  macro strap(type)
    {{type}}.new.not_nil!
  end
end
