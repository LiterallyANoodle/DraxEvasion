extends Area3D
class_name PlacementPoint

const tower_scene = preload("res://base_tower.tscn")

@onready var tower: BaseTower = null
@onready var hover: MeshInstance3D = $HoverVisualizer

func _ready() -> void:
	hover.visible = true

func _on_mouse_entered() -> void:
	if tower == null:
		hover.visible = false

func _on_mouse_exited() -> void:
	if tower == null:
		hover.visible = true

func _on_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if (event is InputEventMouseButton):
		if (event.button_index == 1 and event.pressed == true):
			if tower == null:
				tower = tower_scene.instantiate()
				add_child(tower)
			else:
				tower.queue_free()
		
