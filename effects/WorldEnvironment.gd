extends WorldEnvironment

enum EnvMode {
	MENU
	GAME
}

export(Environment) var MenuEnv
export(Environment) var GameEnv
export(EnvMode) var currentMode = EnvMode.MENU setget set_mode

func set_mode(newState):
	match newState:
		EnvMode.MENU:
			environment = MenuEnv
		EnvMode.GAME:
			environment = GameEnv
