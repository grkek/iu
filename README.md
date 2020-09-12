# IU
UI framework based on the [Fusion/libui.cr](https://github.com/Fusion/libui.cr) library, with custom elements and modified bindings from [hedron-crystal/hedron](https://github.com/hedron-crystal/hedron).

## Motivation
Currently avaliable Crystal UI frameworks are either not maintained anymore or the documentation is scarce and a single error might cause a developer to lose motivation, which is why I decided to build IU on top of the LibUI framework which is a multi-platform powerful UI toolkit.

## Build status
[![Build Status](https://action-badges.now.sh/grkek/iu)](https://github.com/grkek/iu/actions)

## Features
### Widgets
- Horizontal box, Vertical box, Checkbox, Combobox, Editable combobox.
- Button, Font button, Color button, Radio button.
- Datetime picker, Progress bar, Slider, Spinbox.
- Text entry, Multiline text entry.
- Form, Grid, Group, Table, Tab, Separator.
- Image, Label.
- Window, Menubar, Area.
- Many more.

### Platforms
- Mac OSX
- Linux

## Code example
```ruby
require "iu"

module Example
  include Iu::Components

  # Ability to reuse components extracted to other classes.
  class MyComponent < Iu::ReusableComponent
    def initialize(@id : Int32); end

    def render : Iu::Component
      Group
        .new(title: "MyComponent", margined: true)
        .adopt(
          VerticalBox
            .new(padded: true)
            .adopt(
              Label.new(text: "Hello, World ##{@id}!"),
              stretchy: true
            )
            .adopt(
              Button.new(text: "Click Me!"),
              stretchy: true
            )
        )
    end
  end

  # :nodoc:
  class Application < Iu::Application
    def initialize_component
      window =
        Window.new(
          title: "Example",
          width: 800,
          height: 600,
          menu_bar: false
        )
      
      window.margined = true

      window
        .adopt(
          HorizontalBox
            .new(padded: true)
            .adopt(
              MyComponent.new(1),
              stretchy: true
            )
            .adopt(
              MyComponent.new(2),
              stretchy: true
            )
            .adopt(
              MyComponent.new(3),
              stretchy: true
            )
        )

      window.closing.on do
        exit(0)
      end
      
      window.show
    end
  end
end

app = Example::Application.new

app.should_quit.on do
  exit(0)
end

app.start
```

# Installation
1. Follow the instructions for installation laid out in [andlabs/libui](https://github.com/andlabs/libui).
2. Copy the compiled files from step 1 (i.e. files in `build/out`) to `/usr/lib` for OSX and Linux users.
3. Go to your `shard.yml` file, and enter this in:

```yaml
dependencies:
  iu:
    github: grkek/iu
```
4. Run `shards install`.