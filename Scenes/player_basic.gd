extends CharacterBody2D

enum State{IDLE,JUMP,RUN,ATTACK}
var state = State.IDLE

@export var velocidade: int = 290
var my_velocity:Vector2 = Vector2.ZERO
var direcao = 1

@export var animation_player: AnimationPlayer

func _ready():
	set_physics_process(true)

func _physics_process(delta: float) -> void:
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
			pass
		State.RUN:
			move()
		State.ATTACK:
			pass
	
	velocity = my_velocity
	move_and_slide()

func move():
	direcao = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	
	my_velocity.x = velocidade * direcao
	if my_velocity.x == 0:
		state = State.IDLE
	
	
