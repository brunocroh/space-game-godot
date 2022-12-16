extends Node2D

const PRE_LAZER = preload('res://scenes/lazer.tscn')

export var vel = 80
export(NodePath) var lazers


# Called when the node enters the scene tree for the first time.
func _ready():
  if lazers:
    lazers = get_node(lazers)
  else:
    lazers = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var dirX = 0
  var dirY = 0

  if Input.is_action_pressed('ui_left'):
    dirX = -1

  if Input.is_action_pressed('ui_right'):
    dirX = 1

  if Input.is_action_pressed('ui_up'):
    dirY = -1

  if Input.is_action_pressed('ui_down'):
    dirY = 1

  if Input.is_action_just_pressed('ui_accept'):
    if get_tree().get_nodes_in_group('lazers').size() < 5:
      var lazer = PRE_LAZER.instance()
      lazers.add_child(lazer)
      lazer.global_position = $Blaster.global_position 


  translate(Vector2(dirX, dirY) * vel * delta)

  global_position.x = clamp(global_position.x, 21, 139)
  global_position.y = clamp(global_position.y, 24, 266)

  pass
