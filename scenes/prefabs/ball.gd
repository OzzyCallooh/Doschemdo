extends RigidBody2D
class_name Ball

@onready var sprite: Sprite2D = $Sprite2D
@export var bouncy: Bouncy:
	set(value):
		bouncy = value
		update_sprite()

func _ready():
	update_sprite()

func _process(_delta):
	pass

func update_sprite():
	if sprite == null:
		return
	if bouncy:
		sprite.texture = bouncy.texture
	else:
		sprite.texture = null

func _on_body_entered(body: Node):
	if body is Ball:
		pass
	
