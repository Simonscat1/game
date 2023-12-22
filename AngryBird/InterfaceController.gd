extends CanvasLayer

func _ready():
	pass 

func SetScore():
	$InterfaceController/ScoreValue.text = str(int(GameManager.Score))

func PopupLvlComplited(win, score):
	$Popup/ScoreValue.text = str(int(score))
	if win:
		$Popup/WinLose.text = "You Won!"
		if score > 50:
			$Popup/Star1.show()
			$Tween.interpolate_property($Popup/Star1, "rect_size", Vector2(0,0), Vector2(85,85), .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		if score > 500:
			$Popup/Star2.show()
			$Tween.interpolate_property($Popup/Star2, "rect_size", Vector2(0,0), Vector2(85,85), .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		if score > 1000:
			$Popup/Star3.show()
			$Tween.interpolate_property($Popup/Star3, "rect_size", Vector2(0,0), Vector2(85,85), .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		$Popup/WinLose.text = "You Lost!"

	$Popup.show()


func _on_NextLevelButton_button_down():
	GameManager.LoadNextLevel()
	pass # Replace with function body.


func _on_RestartLevelButton_button_down():
	GameManager.RestartLevel()
	pass # Replace with function body.


func _on_MenuButton_button_down():
	GameManager.Menu()
	pass # Replace with function body.
