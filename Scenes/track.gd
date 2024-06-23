extends Node3D

var horde:int = 100
var wave:int = 0
var mobs_left:int = 0
var wave_mobs:Array = [5, 6, 8, 10, 15, 20]
var wave_speed:Array = [1,1,0.5,0.5,0.3,100]

const enemy:PackedScene = preload("res://basic_enemy.tscn")

func _ready() -> void:
	$WaveTimer.start()

func _on_wave_timer_timeout() -> void:
	mobs_left = wave_mobs[wave]
	$EnemyTimer.wait_time = wave_speed[wave]
	$EnemyTimer.start()

func _on_enemy_timer_timeout() -> void:
	$Path3D.add_child(enemy.instantiate())
	mobs_left -= 1
	if mobs_left <= 0:
		$EnemyTimer.stop()
		wave += 1
	if wave < len(wave_mobs):
		$WaveTimer.start()
	else:
		get_tree().change_scene("res://Win.tscn")
