extends Node2D

@onready var player = $player
@onready var spawn_point = $SpawnPoint

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit():
	player.position = spawn_point.position
	player.collision_shape_2d.disabled = false
	player.show()
	pass # Replace with function body.
