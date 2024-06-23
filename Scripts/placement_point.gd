extends Area3D
class_name PlacementPoint

@onready var tower: BaseTower = null
@onready var hover: MeshInstance3D = $HoverVisualizer

func _ready() -> void:
	hover.visible = true

func _on_mouse_entered() -> void:
	hover.visible = false

func _on_mouse_exited() -> void:
	hover.visible = true
