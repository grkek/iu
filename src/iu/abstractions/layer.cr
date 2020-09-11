module Iu
  module Abstractions
    # :nodoc:
    abstract class Layer < Observer
      abstract def create(**kwargs)
      abstract def destroy(**kwargs)

      def attach(child : Layer)
        child.create(**{
          parent: self,
        })

        child
      end
    end
  end
end
