class_name Slime extends Node2D

@onready var collider: CollisionShape2D = $CollisionShape2D

var slimeColor: Color
var radius: float
var slimeLevel: int

func _draw() -> void:
	draw_circle(Vector2(0, 0), collider.shape.radius, slimeColor, true)

func _on_body_entered(body: Node) -> void:
	if (body is Slime) and (slimeColor == body.slimeColor):
		GameManager.registerForMerge(self)
