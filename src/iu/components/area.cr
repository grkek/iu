module Iu
  module Components
    # :nodoc:
    abstract class Area
      include Component
      
      @@on_draw_cb = Proc(UI::AreaHandler*, UI::Area*, UI::AreaDrawParams*, Nil).new { |h, a, p|
        # h.value.data.as(Area*).value.on_draw(p.value).as(Nil)
        ::Box(Area).unbox(h.value.data).on_draw(p.value).as(Nil)
      }

      @@on_mouse_event_cb = Proc(UI::AreaHandler*, UI::Area*, UI::AreaMouseEvent*, Nil).new { |h, a, e|
        # h.value.data.as(Area*).value.on_mouse_event(e.value).as(Nil)
        ::Box(Area).unbox(h.value.data).on_mouse_event(e.value).as(Nil)
      }

      @@on_mouse_crossed_cb = Proc(UI::AreaHandler*, UI::Area*, LibC::Int, Nil).new { |h, a, l|
        # h.value.data.as(Area*).value.on_mouse_crossed(l.to_i > 0).as(Nil)
        ::Box(Area).unbox(h.value.data).on_mouse_crossed(l.to_i > 0).as(Nil)
      }

      @@on_drag_broken_cb = Proc(UI::AreaHandler*, UI::Area*, Nil).new { |h, a|
        # h.value.data.as(Area*).value.on_drag_broken.as(Nil)
        ::Box(Area).unbox(h.value.data).on_drag_broken.as(Nil)
      }

      @@on_key_event_cb = Proc(UI::AreaHandler*, UI::Area*, UI::AreaKeyEvent*, Nil).new { |h, a, e|
        # h.value.data.as(Area*).value.on_key_event(e.value).as(Nil)
        ::Box(Area).unbox(h.value.data).on_key_event(e.value).as(Nil)
      }


      def initialize(width = nil, height = width)
        @handler = UI::AreaHandler.new
        @handler.draw = @@on_draw_cb
        @handler.mouse_event = @@on_mouse_event_cb
        @handler.mouse_crossed = @@on_mouse_crossed_cb
        @handler.drag_broken = @@on_drag_broken_cb
        @handler.key_event = @@on_key_event_cb
        @handler.data = self.as(Void*)

        if width && height
          @area = UI.new_scrolling_area(pointerof(@handler), width, height)
        else
          @area = UI.new_area(pointerof(@handler))
        end

        super(@area.not_nil!)
      end

      abstract def on_draw(params : UI::AreaDrawParams)
      abstract def on_mouse_event(mouse_event : UI::AreaMouseEvent)
      abstract def on_mouse_crossed(left : Bool)
      abstract def on_drag_broken
      abstract def on_key_event(key_event : UI::AreaKeyEvent) : Int32

      def set_size(width : Int32, height : Int32)
        UI.area_set_size(@area, width, height)
      end

      def redraw_all
        UI.area_queue_redraw_all(@area)
      end

      def scroll_to(x : Float64, y : Float64, width : Float64, height : Float64)
        UI.area_scroll_to(@area, x, y, width, height)
      end

      # Can only be used within the `on_mouse_event` and `on_mouse_crossed` handlers.
      def begin_user_window_move
        UI.area_begin_user_window_move(@area)
      end

      # Can only be used within the `on_mouse_event` and `on_mouse_crossed` handlers.
      def begin_user_window_resize(edge : UI::WindowResizeEdge)
        UI.area_begin_user_window_resize(@area)
      end
    end
  end
end
