extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -420.0
var health = 70

@export var Bala:PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioRun.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	decide_animation()
	
	if is_on_floor() and (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		_reproducir_audio($AudioRun)
	elif not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		$AudioRun.stop()

func decide_animation():
	#Eje X
	if velocity.x == 0:
		# idle
		$animaciones.play("idle")
	elif velocity.x < 0:
		#izquierda
		$animaciones.flip_h = true
		$PointLight2D.rotation_degrees = 90
		$PointLight2D.global_position.x = global_position.x - abs($PointLight2D.global_position.x - global_position.x)
		$animaciones.play("run")
		
	elif velocity.x > 0:
		#derecha
		$animaciones.flip_h = false
		$PointLight2D.rotation_degrees = -90
		$PointLight2D.global_position.x = global_position.x + abs($PointLight2D.global_position.x - global_position.x)
		$animaciones.play("run")
		
	#Eje Y
	if velocity.y > 0:
		$animaciones.play("jump")

func _input(event):
	if event.is_action_pressed("Bala"):
		var newBala = Bala.instantiate()
		newBala.global_position = $Marker2D.global_position
		newBala.isFlip = $animaciones.flip_h
		get_parent().add_child(newBala)
		
	if event.is_action_pressed("Linterna"):
		$PointLight2D.enabled = not $PointLight2D.enabled

func _reproducir_audio(audio_node):
	audio_node.volume_db = -10
	if not audio_node.is_playing():
		audio_node.seek(0)
		audio_node.play()
