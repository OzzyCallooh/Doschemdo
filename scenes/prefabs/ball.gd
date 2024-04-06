extends RigidBody2D
class_name Ball

@onready var sprite: Sprite2D = $Sprite2D
@onready var area2d: Area2D = $Area2D
@export var start_speed_mean: float = 140
@export var start_speed_deviation: float = 40
@export var bouncy: Bouncy:
	set(value):
		bouncy = value
		update_sprite()

func _ready():
	linear_velocity = Vector2.from_angle(randf() * PI * 2) * randfn(start_speed_mean, start_speed_deviation)
	update_sprite()

func _process(_delta):
	pass

func update_sprite():
	if sprite == null:
		return
	if bouncy:
		sprite.texture = bouncy.texture
		sprite.modulate = bouncy.color
		collision_layer = bouncy.collision_layer
		collision_mask = bouncy.collision_mask
		area2d.collision_layer = bouncy.area2d_layer
		area2d.collision_mask = bouncy.area2d_mask
	else:
		sprite.texture = null

func _on_body_entered(body: Node):
	if body is Ball and body.bouncy and body.bouncy.transitions.has(bouncy):
		bouncy = body.bouncy
