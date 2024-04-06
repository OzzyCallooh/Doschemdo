extends ColorRect

@export var bouncy: Bouncy:
	set(value):
		bouncy = value
		color = bouncy.color

@export var min_size_factor: Vector2

var last_ball_count = 0

func _ready():
	update_ball_count(0)

func _process(delta):
	var ball_count = Ball.ball_count.get(bouncy, 0)
	if ball_count != last_ball_count:
		update_ball_count(ball_count)

func update_ball_count(ball_count):
	last_ball_count = ball_count
	var tween = create_tween()
	tween.tween_property(self, "custom_minimum_size", ball_count * min_size_factor, 1)
