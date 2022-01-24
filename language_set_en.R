
options(encoding="UTF-8")
Sys.setlocale(category = "LC_ALL", locale = "English")

language_set_en <- function(){
  ls <- list()
  ls$TitleText = "Wordplay, but Wryly!"
  ls$TitleBrowser = "Wryly"
  ls$MainTabGame =  "Game"
  ls$MainTabHowToPlay = "How to Play?"
  ls$MainTabTips = "Tips"
  ls$MainTabOptions = "Options"
  ls$OptionsTabGamePlay = "Gameplay"
  ls$OptionsTabVisuals = "Visuals"
  ls$OptionsTabKeyboard = "Keyboard"
  ls$WordDifficulty = "Word difficulty"
  ls$WordDifficultyImpossible = "Impossible"
  ls$WordDifficultyNormal = "Normal"
  ls$HardcoreModeLabel = "Hardcore Mode:"
  ls$HardcoreModeEnabledLabel = "Enabled"
  ls$HardcoreModeTooltip = "In hardcore mode, entering a word that is not in the dictionary still counts as a guess, but provides no clues."
  ls$HardcoreModeIndicatorLabel = "Hardcore Mode!"
  ls$KeyboardStyleLabel = "Keyboard Style:"
  ls$KeyboardStyleQwerty = "Qwerty (experimental)"
  ls$KeyboardStyleAbcd = "Abcd"
  ls$KeyboardSizeLabel = "Keyboard Size:"
  ls$AnimationSpeedLabel = "Animation Speed:"
  ls$AnimationSpeedOff = "Off"
  ls$NightModeLabel = "Night mode:"
  ls$NightModeEnabled = "Enabled"
  ls$NightModeDisabled = "Disabled"
  
  ls$HowtoplayAim = "There is a hidden 5-letter word, the aim is to find it!"
  ls$HowtoplayGuesses = "A total of 6 guesses are allowed. Each guess has to be a meaningful 5-letter english word."
  ls$HowtoplayClues = "After each guess, a clue is provided based on the coloring of the letters: "
  
  ls$GrayColors = "Gray Colors"
  ls$HowtoplayGrayDesc = " indicate that the hidden word doesn't contain the corresponding letter."
  ls$OrangeColors = "Orange Colors"
  ls$HowtoplayOrangeDesc = " indicate that the hidden word contains the corresponding letter, but the positioning of the letter is incorrect."
  ls$GreenColors = "Green Colors"
  ls$HowtoplayGreenDesc = " indicate that the hidden word contains the corresponding letter, and the positioning of the letter is correct!"
  
  ls$HowtoplayBeforeBrown = "Additionally, "
  ls$BrownColors = "Brown Colors"
  ls$HowtoplayAfterBrown = " in hardcore mode indicate that the letter does not provide any clues."
  
  ls$RestartUpdateButtonLabel = "Restart & Update Word"
  
  ls$GameOverNotification = "Game is over. The correct word was:"
  ls$GameIsOverNotification = "Game is over"
  ls$CorrectWordWasNotification = "The correct word was:"
  ls$YourCorrectStreakNotification = "You have achieved streak: "
  ls$WordNotFoundNotification = "Word not found in the dictionary."
  ls$PleaseEnter5LetterWordNotification = "Please enter a 5 letter word."
  ls$GameOverRestartNotification = "Game is over. Click restart to play again. "
  ls$YouFoundAnswerNotification = "You found the answer. "
  ls$RestartedNotification = "Successfully restarted."
  ls$WordUpdatedNotification = "The target word is updated. "
  
  ls$WordFoundComments = c("Lucky!", "Genius!", "Splendid!", "Niceee!", "Good job.", "Not bad.")
  
  return(ls)
}




