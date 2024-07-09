extends CanvasLayer
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# var button = Button.new() 
	# button.text = "Click me" 
	# button.pressed.connect(self._on_startButton_pressed) 
	# add_child(button)

	pass # Replace with function body.

func show_message(text):
	$message.text = text
	$message.show()
	$messageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $messageTimer.timeout

	$message.text = "Dodge the \nCreeps!"
	$message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$startButton.show()

func update_score(score):
	$scoreLabel.text = str(score)

func _on_startButton_pressed():
	$startButton.hide()
	print("start game")
	# emit("start_game")
	# start_game.emit()
	start_game.emit()
	# print("button")

func _on_messageTimer_timeout():
	$message.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
