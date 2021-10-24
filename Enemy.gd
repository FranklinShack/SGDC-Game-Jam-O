extends Node2D
var Player

func _ready():
	pass

func _physics_process(delta):
	var space_rid = get_world_2d().space
	var space_state = Physics2DServer.space_get_direct_state(space_rid)
	var result = space_state.intersect_ray(global_position, Player.global_position, [self])
	var seen = true
	for item in result:
		if result.collider != Player:
			seen = false
			break
	if !seen:
		get_parent().remove_child(self)
	