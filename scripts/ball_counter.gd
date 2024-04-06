extends ColorRect

@export var bouncy: Bouncy:
	set(value):
		bouncy = value
		color = bouncy.color

@export var min_size_factor: Vector2

func _process(delta):
	custom_minimum_size = Ball.ball_count.get(bouncy, 0) * min_size_factor
