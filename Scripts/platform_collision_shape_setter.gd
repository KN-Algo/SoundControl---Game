extends CollisionShape2D
@onready var platform_shape: CollisionShape2D = $"../../Platform_shape"

func _ready():
	shape = platform_shape.shape
