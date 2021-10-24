extends Node2D

var Player
var rng = RandomNumberGenerator.new()
var enemy
func _ready():
	if Player == null:
		Player = get_parent().get_node("Player") 
	rng.randomize()
	var randNum = rng.randi_range(0,4)
	if (randNum == 0):
		enemy = load("res://Enemy.tscn")
	elif (randNum == 1):
		enemy = load("res://Enemy1.tscn")
	elif (randNum == 2):
		enemy = load("res://Enemy2.tscn")
	elif (randNum == 3):
		enemy = load("res://Enemy3.tscn")
	elif (randNum == 4):
		enemy = load("res://Enemy4.tscn")

func _physics_process(delta):
	spawnAndDespawn()

func spawnAndDespawn():
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

