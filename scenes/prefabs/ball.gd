extends RigidBody2D
class_name Ball

static var ball_count: Dictionary = Dictionary()

@onready var sprite: Sprite2D = $Sprite2D
@onready var area2d: Area2D = $Area2D
@onready var changed_sound: AudioStreamPlayer = $ChangedSound
@export var start_speed_mean: float = 140
@export var start_speed_deviation: float = 40
@export var bouncy: Bouncy:
	set(value):
		if bouncy != null:
			ball_count[bouncy] = ball_count.get(bouncy, 1) - 1
		bouncy = value
		if changed_sound != null:
			changed_sound.play()
		if bouncy != null:
			ball_count[bouncy] = ball_count.get(bouncy, 0) + 1
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
		changed_sound.pitch_scale = bouncy.change_sound_pitch
		sprite.texture = bouncy.texture
		var tween = create_tween()
		tween.tween_property(sprite, "modulate", bouncy.color, 1)
		collision_layer = bouncy.collision_layer
		collision_mask = bouncy.collision_mask
		area2d.collision_layer = bouncy.area2d_layer
		area2d.collision_mask = bouncy.area2d_mask
	else:
		sprite.texture = null

func _on_body_entered(body: Node):
	if body is Ball and body.bouncy and body.bouncy.transitions.has(bouncy):
		bouncy = body.bouncy
