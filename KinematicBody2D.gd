extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export (int) var speed = 200
var bullet_speed = 1000
var velocity = Vector2()

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed("right"):
        velocity.x += 1
    if Input.is_action_pressed("left"):
        velocity.x -= 1
    if Input.is_action_pressed("down"):
        velocity.y += 1
    if Input.is_action_pressed("up"):
        velocity.y -= 1
    velocity = velocity.normalized() * speed
   # if Input.is_action_pressed("LMB"):
    	#fire()

func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)

#func fire():
#	var bullet_instance = bullet.instance()
#	var rotation  = 180
#	bullet_instance.position = get_global_position()
#	bullet_instance.rotation_degrees = rotation_degrees
#	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
#	get_tree().get_root().call_deferred("add_child",bullet_instance)