require "./widget/widget.cr"

module Iu
  class Render
    property widget : Iu::Widget::Widget
    getter children : Hash(String, Render)
    getter aliases = {} of String => Array(String)

    def initialize(@widget)
      @aliases[@widget.id] = [] of String if @widget.id[0] != '!'
      @children = {} of String => Render
    end

    # :no-doc:
    def add_child(child : Render)
      id = child.widget.id

      @aliases[id] = [] of String if id[0] != '!'

      child.aliases.keys.each do |key|
        @aliases[key] = [id] + child.aliases[key]
      end

      @children[id] = child
    end
  end
end
