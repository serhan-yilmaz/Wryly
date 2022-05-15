
#options(encoding="UTF-8")
Sys.setlocale(category = "LC_ALL", locale = "German")

language_set_de <- function(){
  ls <- list()
  ls$TitleText = "Wordle, aber Deutsch!"
  ls$TitleBrowser = "Wryly Deutsch!"
  ls$MainTabGame =  "Spiel"
  ls$MainTabHowToPlay = "Spielregeln"
  ls$MainTabTips = "Tipps"
  ls$MainTabOptions = "Einstellungen"
  ls$HowtoplayTabBasics = "Grundlagen"
  ls$OptionsTabGamePlay = "Spielverlauf"
  ls$OptionsTabVisuals = "Grafik"
  ls$OptionsTabKeyboard = "Tastatur"
  ls$WordDifficulty = "Schwierigkeit"
  ls$WordDifficultyImpossible = "Unmöglich"
  ls$WordDifficultyNormal = "Normal"
  ls$HardcoreModeLabel = "Hardcore-Modus:"
  ls$HardcoreModeEnabledLabel = "Aktiviert"
  ls$HardcoreModeTooltip = "Im Hardcore-Modus wird die Eingabe eines Wortes, das nicht im Wörterbuch steht, zwar als Rateversuch gewertet, liefert aber keine Anhaltspunkte"
  ls$HardcoreModeIndicatorLabel = "Hardcore-Modus!"
  ls$KeyboardStyleLabel = "Tastatur-Stil:"
  ls$KeyboardStyleQwerty = "Qwertz"
  ls$KeyboardStyleAbcd = "Abcd"
  ls$KeyboardSizeLabel = "Tastaturgröße"
  ls$KeyboardHorizontalMargin = "Waagerechter Rand:"
  ls$KeyboardVerticalMargin = "Senkrechter Rand:"
  ls$AnimationSpeedLabel = "Animationsgeschwindigkeit:"
  ls$AnimationSpeedOff = "Aus"
  ls$NightModeLabel = "Nachtmodus:"
  ls$NightModeEnabled = "Aktiviert"
  ls$NightModeDisabled = "Deaktiviert"
  # ls$ColorblindModeLabel = "Colorblind mode:"
  # ls$ColorblindModeEnabled = "Enabled"
  # ls$ColorblindModeDisabled = "Disabled"
  ls$ColorblindModeLabel = "Farbpalette:"
  ls$ColorblindModeEnabled = "Farbenblind-freundlich"
  ls$ColorblindModeDisabled = "Standard (Orange/Grün)"
  
  ls$HowtoplayAim = "Ein Wort mit 5 Buchstaben ist versteckt. Das Ziel ist es, das Wort zu finden!"
  ls$HowtoplayGuesses = "Es sind insgesamt 6 Rateversuchen erlaubt. Jeder Rateversuch muss ein sinnvolles deutsches Wort mit 5 Buchstaben sein."
  ls$HowtoplayClues = "Nach jedem Rateversuch wird ein Anhaltspunkt anhand der Farbe des Buchstabens gegeben: "
  
  ls$GrayColors = "Grau"
  ls$HowtoplayGrayDesc = " zeigt an, dass das versteckte Wort den entsprechenden Buchstaben nicht enthält."
  ls$OrangeColors = "Orange"
  ls$ColorblindOrangeColors = "Gelb"
  ls$HowtoplayOrangeDesc = " zeigt an, dass das versteckte Wort den entsprechenden Buchstaben enthält, aber die Positionierung des Buchstabens ist falsch."
  ls$GreenColors = "Grün"
  ls$ColorblindGreenColors = "Blau"
  ls$HowtoplayGreenDesc = "zeigt an, dass das versteckte Wort den entsprechenden Buchstaben enthält, und die Positionierung des Buchstabens ist richtig!"
  
  ls$HowtoplayBeforeBrown = "Zusätzlich, "
  ls$BrownColors = "Braun"
  ls$HowtoplayAfterBrown = " im Hardcore-Modus zeigt an, dass die Buchstaben keine Anhaltspunkte liefert"
  
  ls$RestartUpdateButtonLabel = "Neu starten & das Wort aktualisieren"
  
  ls$GameOverNotification = "Das Spiel ist vorbei. Das richtige Wort:"
  ls$GameIsOverNotification = "Das Spiel ist vorbei"
  ls$CorrectWordWasNotification = "Das richtige Wort:"
  ls$YourCorrectStreakNotification = "Sie haben Streak erreicht: "
  ls$WordNotFoundNotification = "Wort nicht im Wörterbuch gefunden."
  ls$PleaseEnter5LetterWordNotification = "Bitte ein Wort mit 5 Buchstaben eingeben."
  ls$GameOverRestartNotification = "Das Spiel ist vorbei. Klicken Sie auf Neustart, um erneut zu spielen. "
  ls$YouFoundAnswerNotification = "Sie haben die Antwort gefunden. "
  ls$RestartedNotification = "Erfolgreich neu gestartet."
  ls$WordUpdatedNotification = "Das Zielwort wird aktualisiert. "
  ls$HiddenWordWasNotification = "Das versteckte Wort:"
  
  ls$WordFoundComments = c("Erfolgreich!", "Genial!", "Prächtig!", "Schön!", "Gut gemacht.", "Nicht schlecht.")
  
  ls$TipsInitialRound = "Für die erste Runde können OZEAN und OPIUM gut erraten werden, die 3 Vokale abdecken. "
  ls$TipsFollowup = "Eine gute Fortsetzung kann INTRO oder BAGEL sein, um die verbleibenden zwei Vokale abzudecken."
  #ls$TipsAdditional = "SYNCH und GLYPH können gute Optionen sein, um mehrere Konsonanten gleichzeitig zu testen."
  ls$TipsAdditional = ""
  ls$TipsRememberLabel = "Erinnerung:"
  ls$TipsRememberText = " Es kann mehr als ein Exemplar desselben Buchstabens geben, was bei Vokalen häufig vorkommt. Daher kann es wichtig sein, mit Rateversuchen wie CREME oder KRANK auf Multiplizitäten zu testen. "
  
  return(ls)
}




