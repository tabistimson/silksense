class_name Player extends CharacterBody2D


const SPEED = 100.0
var direction : Vector2 = Vector2.ZERO #These are default values
var state : String = "idle"
var cardinal_direction : Vector2 = Vector2.DOWN

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	direction.y = Input.get_axis("up","down")
	direction.x = Input.get_axis("left", "right")
	velocity = direction * SPEED
	
	if set_state() == true || set_direction() == true:
		update_animation()
	pass

func _physics_process(delta: float) -> void:
	
	move_and_slide()
	
	

func set_state() -> bool :
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state: 
		return false
	state = new_state
	return true
	
func set_direction() -> bool :
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false 
		
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0: 
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	animated_sprite_2d.scale.x = -3 if cardinal_direction == Vector2.LEFT else 3
	return true
	
	
	
func update_animation() -> void:
	animated_sprite_2d.play(state + "_" + anim_direc())
	
func anim_direc() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
		
	
	
	
	
	
 
	
	
