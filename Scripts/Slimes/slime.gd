class_name Slime extends Node2D

@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var mergeArea: CollisionShape2D = $MergeArea/CollisionShape2D

var slimeColor: Color
var radius: float = 20
var slimeLevel: int
var id = randf()

func _ready() -> void:
	set("contact_monitor", true)
	set("max_contacts_reported", 3)
	radius *= pow(sqrt(2), slimeLevel-1)
	collider.shape.radius = radius
	mergeArea.shape.radius = radius + 1

func _draw() -> void:
	draw_circle(Vector2(0, 0), collider.shape.radius, slimeColor, true)



func _on_body_entered(body: Node) -> void:
	if (slimeLevel < GameManager.biggestSlimeLevel) and (body is Slime) and (slimeLevel == body.slimeLevel):
		if(id > body.id):
			var mergePos = (global_position + body.global_position)/2
			GameManager.processMerge(mergePos, slimeLevel)
			body.queue_free()
			queue_free()


func _on_merge_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
