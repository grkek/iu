module Iu::Abstractions
  abstract class Observer
    abstract def create(*args, **kwargs)
    abstract def destroy(*args, **kwargs)
  end
end
