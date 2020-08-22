require "../src/iu"
require "./control_gallery/*"

app = Iu::Application.new

# Build the application like layers
app.add_layer(MenuLayer.new)
app.add_layer(WindowLayer.new)
app.add_layer(BoxLayer.new)
app.add_layer(GroupLayer.new)
app.add_layer(UiLayer.new)
app.add_layer(FunctionLayer.new)

app.start
