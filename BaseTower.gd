extends Node3D

var head:Node3D

const bullet:PackedScene = preload("res://projectile.tscn")
var enemies:Array = []
var current_enemy:Path3D

func _ready() -> void:
	head = $TowerHead

func _physics_process(_delta: float) -> void:
	if enemies != []:
		current_enemy = enemies[0]
		head.rotate_toward(current_enemy.global_position)

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		enemies.append(area)


func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		enemies.erase(area)


func _on_shoot_timer_timeout() -> void:
	if current_enemy:
		if enemies:
			if current_enemy == enemies[0]:
				var b:Node = bullet.instantiate()
				b.target = current_enemy
				get_parent().add_child(b)
