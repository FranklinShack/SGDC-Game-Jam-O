extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var Player = get_parent().get_node("Player");
	var space_rid = get_world_2d().space
	var space_state = Physics2DServer.space_get_direct_state(space_rid)
	var result = space_state.intersect_ray(global_position, Player.global_position, [self])
	if result.collider == Player:
		print("I SEE DABABY!!!")
	else:
		print("wHeRe Da BaBy?1!/?1!")