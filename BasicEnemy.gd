extends PathFollow3D

@onready var animation: AnimationPlayer = $AnimationPlayer

var health:int = 20
var speed:int = 1


func _ready() -> void:
	SignalBus.connect("DAMAGE_ENEMY", _take_damage)

func _physics_process(delta: float) -> void:
	progress += speed * delta 
	if progress_ratio >= 1.0:
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/lose.tscn")

func _process(delta: float) -> void:
	if fmod(self.rotation_degrees.y + 360, 360.0) >= 45.0 and fmod(self.rotation_degrees.y + 360, 360.0) < 135.0:
		animation.play("walk_west")
	elif fmod(self.rotation_degrees.y + 360, 360.0) >= 135.0 and fmod(self.rotation_degrees.y + 360, 360.0) < 225.0:
		animation.play("walk_south")
	elif fmod(self.rotation_degrees.y + 360, 360.0) >= 225.0 and fmod(self.rotation_degrees.y + 360, 360.0) <= 315.0:
		animation.play("walk_east")
	else:
		animation.play("walk_north")

func _take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		queue_free()
