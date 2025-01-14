extends Slime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slimeColor = Color.RED
	radius = 20
	slimeLevel = 1
	collider.shape.radius = radius
