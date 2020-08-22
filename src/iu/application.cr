require "./abstractions/*"
require "./bindings.cr"

module Iu
  class Application
    include Iu::Abstractions::Observable(Iu::Abstractions::Observer)

    getter storage : Hash(String, Iu::Widget::Control)

    @@box : Void*?

    def initialize
      @initialization_options = UI::InitOptions.new
      @storage = {} of String => Iu::Widget::Control
      err = UI.init pointerof(@initialization_options)
      if !ui_nil?(err)
        @observers.try &.each &.throw(
          Exception.new("Failed to initialize the UI, #{err}")
        )
      end
    end

    def get(name : String)
      @storage[name]
    end

    def set(name : String, value : Iu::Widget::Control)
      @storage[name] = value
    end

    def get?(name : String)
      @storage[name]?
    end

    def start
      @observers.try &.each &.create(*{self})
      UI.main
    end

    def on_stop(&block)
      self.on_stop = block
    end

    def on_stop=(proc : Proc(Nil))
      boxed_data = ::Box.box(proc)
      @@box = boxed_data

      new_proc = ->(data : Void*) {
        callback = ::Box(Proc(Nil)).unbox(data)
        return callback.call ? 1 : 0
      }

      UI.on_should_quit(new_proc, boxed_data)
    end

    def stop
      UI.quit
    end

    def close
      UI.uninit
    end
  end
end
