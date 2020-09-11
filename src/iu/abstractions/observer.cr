module Iu
  module Abstractions
    # :nodoc:
    abstract class Observer
      abstract def create(**kwargs)
      abstract def destroy(**kwargs)
    end
  end
end
