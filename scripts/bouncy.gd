extends Resource
class_name Bouncy

@export var name: String = ""
@export var texture: Texture = null
@export var color: Color = Color.WHITE

var bouncy_transitions: BouncyTransitions:
	get:
		if bouncy_transitions == null:
			var transitions_path: String = resource_path.insert(resource_path.length() - 5, "_transitions")
			bouncy_transitions = load(transitions_path)
		return bouncy_transitions

var transitions: Array[Bouncy]:
	get:
		return bouncy_transitions.transitions

func _init(name_: String = "", texture_: Texture = null, color_: Color = Color.WHITE):
	name = name_
	texture = texture_
	color = color_
