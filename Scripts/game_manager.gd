extends Node2D

var redSlime = preload("res://Scenes/Slimes/red_slime.tscn")
var orangeSlime = preload("res://Scenes/Slimes/orange_slime.tscn")
var yellowSlime = preload("res://Scenes/Slimes/yellow_slime.tscn")

var biggestSlimeLevel = 3

var slimeDict = {
	1 : redSlime,
	2 : orangeSlime,
	3 : yellowSlime
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("DropBall"):
		#spawn slime at mouse curser on click
		spawnSlime(Vector2(get_global_mouse_position().x, 50), 1)

func spawnSlime(pos: Vector2, slimeLevel: int):
	var newSlime = slimeDict[slimeLevel].instantiate()
	newSlime.position = pos
	get_parent().add_child(newSlime)

func processMerge(mergePos: Vector2, slimeLevel: int):
	call_deferred("spawnSlime", mergePos, slimeLevel+1)
