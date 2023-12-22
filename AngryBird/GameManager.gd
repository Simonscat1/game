extends Node2D

enum GameState {
	Start,
	Play,
	Win,
	Lose
}

var CurrentGameState = GameState.Start
var Score = 0
var hasPopedUp
var Levels = ["res://MainScene.tscn", "res://Level2.tscn"]
var LevelIndex = 0
var Menu = "res://main_menu.tscn"

func _ready():
	pass 

func _process(delta):
	match CurrentGameState:
		GameState.Start:
			hasPopedUp = false
			pass
		GameState.Play:
			get_tree().get_nodes_in_group("InterfaceController")[0].SetScore()
			var birds = get_tree().get_nodes_in_group("Bird")
			var pigs = get_tree().get_nodes_in_group("Pigs")
			if pigs.size() <= 0:
				CurrentGameState = GameState.Win
			elif birds.size() <= 0:
				CurrentGameState = GameState.Lose
			
			pass
		GameState.Win:
			if !hasPopedUp:
				get_tree().get_nodes_in_group("InterfaceController")[0].PopupLvlComplited(true, Score)
				hasPopedUp = true
				print("You Win")
		GameState.Lose:
			if !hasPopedUp:
				get_tree().get_nodes_in_group("InterfaceController")[0].PopupLvlComplited(false, Score)
				hasPopedUp = true
				print("You Lose")
	pass
	
func RestartLevel():
	get_tree().change_scene(Levels[LevelIndex])
	ResetGameManager()
	
func LoadNextLevel():
	LevelIndex += 1
	if LevelIndex > Levels.size() - 1:
		LevelIndex = 0
	get_tree().change_scene(Levels[LevelIndex])
	ResetGameManager()
	
func Menu():
	get_tree().change_scene(Menu)
	ResetGameManager()

func ResetGameManager():
	CurrentGameState = GameState.Start
	Score = 0
	

