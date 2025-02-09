extends CollisionPolygon2D

var children
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children = get_child(0)
	children.polygon = polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
