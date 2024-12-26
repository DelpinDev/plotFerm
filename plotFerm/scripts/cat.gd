extends StaticBody2D

const SPEED = 80
var direction = -1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_right_down = $RayCastRightDown
@onready var ray_cast_left_down = $RayCastLeftDown

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += SPEED * direction * delta
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
	pass
