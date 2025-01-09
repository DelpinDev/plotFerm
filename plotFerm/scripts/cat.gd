extends RigidBody2D

@export var speed = 80
var temp_speed = 0
@export var direction = -1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_right_down = $RayCastRightDown
@onready var ray_cast_left_down = $RayCastLeftDown

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	temp_speed = speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if ray_cast_left.is_colliding():
		sprite_2d.flip_h = true
		direction = 1
	if ray_cast_right.is_colliding():
		sprite_2d.flip_h = false
		direction = -1
	if !ray_cast_left_down.is_colliding():
		sprite_2d.flip_h = true
		direction = 1
	if !ray_cast_right_down.is_colliding():
		sprite_2d.flip_h = false
		direction = -1
	position.x += speed * direction * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_entered():
	speed = temp_speed
	$CollisionShape2D.disabled = false
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	speed = 0
	pass # Replace with function body.
