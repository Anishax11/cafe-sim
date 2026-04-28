extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var inventory 
var input_disabled
var pause_menu
var speed=70
var direction: Vector2
var points
var drink_menu
var click_blocker
var task_manager

func _ready() -> void:
	var cam = get_node("Camera2D")
	cam.limit_bottom = 200
	cam.limit_top = -370
	cam.limit_left = -320
	cam.limit_right = 475
	inventory = get_node("Inventory")
	drink_menu= get_node("DrinkMenu")

func _physics_process(delta: float) -> void:

		
	if direction==Vector2(0,1):
		#rotation_degrees=0
		animated_sprite_2d.play("front")
	if direction==Vector2(0,-1):
		#rotation_degrees=0
		animated_sprite_2d.play("back")
	if direction==Vector2(-1,0):
		#rotation_degrees=0
		animated_sprite_2d.play("left")
	if direction==Vector2(1,0):
		animated_sprite_2d.stop
		#rotation_degrees=0
		animated_sprite_2d.play("right")	
		
	if direction.y==1:
		
		if direction.x==-1:
			animated_sprite_2d.play("left")
			#print("MOving down left")
		if direction.x==1:
			
			animated_sprite_2d.play("right")
			#print("MOving down right")
			

	elif direction.y==-1:
		
		
		if direction.x==-1:
			animated_sprite_2d.play("left")
			#print("MOving up left")
		if direction.x==1:
			animated_sprite_2d.play("right")

		
	position+=speed*direction*delta
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	#print("INput playerr")
	if input_disabled==true:
		return	
	direction=Vector2.ZERO
	if Input.is_action_pressed("Shift"):
		speed=120
	else:
		speed=70	
	if Input.is_action_pressed("Up"):
		direction.y-=1
		
	if Input.is_action_pressed("Down"):
		direction.y+=1
	if Input.is_action_pressed("Right"):
		direction.x+=1
		
	if Input.is_action_pressed("Left"):
		direction.x-=1
	if Input.is_action_just_pressed("Inventory"):
		drink_menu.visible = false
		inventory.visible = not inventory.visible
	if Input.is_action_just_pressed("DrinkMenu"):
		inventory.visible = false
		drink_menu.visible = not drink_menu.visible
	
	if Input.is_action_just_pressed("Tasks"):
		task_manager.visible=!task_manager.visible
		click_blocker.visible = inventory.visible or task_manager.visible
		
	

func _on_animated_sprite_2d_animation_finished() -> void:
	
	animated_sprite_2d.play(animated_sprite_2d.animation+"_idle")
