extends Node3D
class_name BaseTower

var head:Node3D

const bullet:PackedScene = preload("res://projectile.tscn")
var enemies:Array = []
var current_enemy:Area3D

func _ready() -> void:
	head = $TowerHead

func _physics_process(_delta: float) -> void:
	if enemies != []:
		current_enemy = enemies[0]

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		enemies.append(area)


func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		enemies.erase(area)


func _on_shoot_timer_timeout() -> void:
	if current_enemy:
		if enemies:
			add_child(bullet.instantiate())
			for i in range(enemies.size()):
				SignalBus.DAMAGE_ENEMY.emit(1)
