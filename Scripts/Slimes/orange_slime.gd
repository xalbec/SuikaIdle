extends Slime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slimeColor = Color.ORANGE
	radius = 30
	slimeLevel = 2
	collider.shape.radius = radius
