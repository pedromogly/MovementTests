extends CharacterBody2D

enum State{IDLE,JUMP,RUN,ATTACK}
var state = State.IDLE

@export var velocidade: int = 290
var my_velocity:Vector2 = Vector2.ZERO
var direcao = 1

@export var gravidade:int = 2900
@export var force_jump = -2000
@export var raycast_jump:Node2D

@export var sprite: Sprite2D
@export var animation_player: AnimationPlayer

func _ready():
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	match state:
		State.IDLE:
			animation_player.play("idle")
			my_velocity = my_velocity.move_toward(Vector2.ZERO, delta)
			if Input.is_action_pressed("Right") or Input.is_action_pressed("Left"):
				state = State.RUN
			
			if Input.is_action_pressed("Jump"):
				state = State.JUMP
			
			if Input.is_action_pressed("Atack"):
				state = State.ATTACK
		State.JUMP:
			if verify_floor():
				jump()
			pass
		State.RUN:
			move()
		State.ATTACK:
			pass
	
	velocity = my_velocity
	move_and_slide()
	

func jump():
	my_velocity.y = force_jump / 2
	state = State.IDLE

func apply_gravity(delta):
	my_velocity.y += gravidade * delta

func verify_floor():
	for raycast in raycast_jump.get_children():
		if raycast.is_colliding():
			return true
	return false

func flip():
	if direcao > 0:
		sprite.flip_h = false
	elif direcao < 0:
		sprite.flip_h = true

func move():
	direcao = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	
	my_velocity.x = velocidade * direcao
	if my_velocity.x == 0:
		state = State.IDLE
	
	flip()
	
