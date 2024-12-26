extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var jumping = false
const JUMP_VELOCITY_MULTIPLIER = 1.5
@export_range(0.0 , 1.0) var friction = 0.26
@export_range(0.0 , 1.0) var acceleration = 0.5

@onready var coyote_timer = $CoyoteTimer
var coyote_frames = 8
var coyote = false
var last_floor = false

@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var jumpsfx = $Jump


func _ready():
	coyote_timer.wait_time = coyote_frames / 60.0
	pass


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE) or Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/gui.tscn")
	if !get_node("CollisionShape2D"):
		animation_player.play("die")
	pass


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("up") and (is_on_floor() or coyote):
		velocity.y = JUMP_VELOCITY
		jumpsfx.play()
		jumping = true
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	if direction != 0:
		velocity.x = lerp(velocity.x, direction * SPEED, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	if direction < 0:
		sprite_2d.flip_h = true
	elif direction > 0:
		sprite_2d.flip_h = false

	move_and_slide()
	if is_on_floor() and jumping:
		jumping = false
	if !is_on_floor() and last_floor and !jumping:
		coyote = true
		coyote_timer.start()
	last_floor = is_on_floor()


func _on_coyote_timer_timeout():
	coyote = false
	pass # Replace with function body.
