extends KinematicBody2D

export var speed = 180
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = Vector2()
	if(Input.is_action_pressed("ui_right") ):
		velocity.x += 1
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	move_and_collide(velocity * delta)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "Right" if velocity.x > 0 else "Left"
	elif velocity.y != 0:
		$AnimatedSprite.animation = "Up" if velocity.y < 0 else "Down"

