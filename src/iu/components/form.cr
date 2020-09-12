module Iu
  module Components
    # :nodoc:
    class Form
      include Component
      getter children : Array(Component)

      def initialize(@label : String)
        @form = UI.new_form
        super(@form)
        @children = [] of Component
      end

      # Appends a child to the form.
      def append(child, stretchy = false)
        UI.form_append(@form, @label, child, stretchy)
        @children << child
      end

      # Delete a child from the form.
      def delete(index)
        UI.form_delete(@form, index)
        @children[index].destroy
        @children.delete_at(index)
      end

      # Returns true if this form is padded.
      def padded?
        UI.form_padded(@form)
      end

      # Sets whether this form is padded.
      def padded=(value : Bool)
        UI.form_set_padded(@form, value)
      end

      def adopt(component : Component)
        self.append(component)
        self
      end
    end
  end
end
