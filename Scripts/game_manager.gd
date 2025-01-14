extends Node2D

var redSlime = preload("res://Scenes/Slimes/red_slime.tscn")
var orangeSlime = preload("res://Scenes/Slimes/orange_slime.tscn")

var slimeDict = {
	1 : redSlime,
	2 : orangeSlime
}

var registeredMerges: Array[Slime]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("DropBall"):
		#spawn slime at mouse curser on click
		spawnSlime(get_global_mouse_position(), 1)
		
	processMerges()

func spawnSlime(pos: Vector2, slimeLevel: int):
	var newSlime = slimeDict[slimeLevel].instantiate()
	newSlime.position = pos
	add_child(newSlime)

#Called by Slimes to register themselves for Merging
func registerForMerge(slime: Slime):
	registeredMerges.append(slime)

#Logic for destroying old slimes and creating new bigger slime
func processMerges():
	if(registeredMerges.size() > 1):
		var mergePos = (registeredMerges[0].position + registeredMerges[1].position)/2
		var slimeLevel = registeredMerges[0].slimeLevel
		registeredMerges[0].queue_free()
		registeredMerges[1].queue_free()
		spawnSlime(mergePos, slimeLevel + 1)
		registeredMerges.clear()
	else:
		pass
