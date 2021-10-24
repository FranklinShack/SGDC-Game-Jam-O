extends Node2D

var enemy = preload("res://Enemy.tscn")
var Player


func _ready():
	Player = get_parent().get_node("Player") 

func _physics_process(delta):
	var space_rid = get_world_2d().space
	var space_state = Physics2DServer.space_get_direct_state(space_rid)
	var result = space_state.intersect_ray(global_position, Player.global_position, [self])
	var seen = true
	for item in result:
		if result.collider != Player:
			seen = false
			break
	if seen:
		var enemy_instance = enemy.instance()
		enemy_instance.Player = Player
		enemy_instance.position = get_global_position()
		get_tree().get_root().call_deferred("add_child",enemy_instance)
		get_parent().remove_child(self)
