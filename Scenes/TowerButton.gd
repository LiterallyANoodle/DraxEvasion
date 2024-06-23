extends Button
@export var TowerButtonIcon:Texture2D
@export var TowerButtonDragNDrop:PackedScene


var isDragging:bool = false
var draggable:Node
var camera:Camera3D
var raycastLength:float = 100000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon = TowerButtonIcon
	draggable = TowerButtonDragNDrop.instantiate()
	add_child(draggable)
	draggable.visible = false
	camera = get_viewport().get_camera_3d()

func _physics_process(_delta: float) -> void:
	if isDragging:
		var spaceState:PhysicsDirectSpaceState3D = draggable.get_world_3d().direct_space_state
		var mousePos:Vector2 = get_viewport().get_mouse_position()
		var origin:Vector3 = camera.project_ray_origin(mousePos)
		var end:Vector3 = origin + camera.project_ray_normal(mousePos)
		var query:PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		var rayResult:Dictionary = spaceState.intersect_ray(query)
		if rayResult.size() > 0:
			var co:CollisionObject3D = rayResult.get("collider")
			print(co)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_down() -> void:
	isDragging = true

func _on_button_up() -> void:
	isDragging = false
