
options(encoding="UTF-8")
Sys.setlocale(category = "LC_ALL", locale = "Turkish")

language_set_tr <- function(){
  ls <- list()
  ls$TitleText = "Wordle, ama Türkçe!"
  ls$TitleBrowser = "Türkçe Wryly!"
  ls$MainTabGame =  "Oyun"
  ls$MainTabHowToPlay = "Nasıl oynanır?"
  ls$MainTabTips = "Tüyo"
  ls$MainTabOptions = "Seçenekler"
  ls$OptionsTabGamePlay = "Oynanış"
  ls$OptionsTabVisuals = "Görseller"
  ls$OptionsTabKeyboard = "Klavye"
  ls$WordDifficulty = "Kelime Zorluğu"
  ls$WordDifficultyImpossible = "Zor"
  ls$WordDifficultyNormal = "Normal"
  ls$HardcoreModeLabel = "Çetinceviz Modu:"
  ls$HardcoreModeEnabledLabel = "Aktif"
  ls$HardcoreModeTooltip = "Çetinceviz modunda, sözlükte olmayan bir kelime girmek yine de bir tahmin olarak sayılır ama bir ipucu vermez."
  ls$HardcoreModeIndicatorLabel = "Çetinceviz Modu!"
  ls$KeyboardStyleLabel = "Klavye Stili:"
  ls$KeyboardStyleQwerty = "Qwerty (deneysel)"
  ls$KeyboardStyleAbcd = "Abcd"
  ls$KeyboardSizeLabel = "Klavye Boyutu:"
  ls$KeyboardHorizontalMargin = "Yatay Bosluk:"
  ls$KeyboardVerticalMargin = "Dikey Bosluk:"
  ls$AnimationSpeedLabel = "Animasyon Hızı:"
  ls$AnimationSpeedOff = "Kapalı"
  ls$NightModeLabel = "Gece modu:"
  ls$NightModeEnabled = "Aktif"
  ls$NightModeDisabled = "Deaktif"
  
  ls$HowtoplayAim = "Gizli 5 harfli bir kelime var, amacımız tahminler yaparak o kelimeyi bulmak!"
  ls$HowtoplayGuesses = "Toplam 6 tahmin hakkı var ve her tahmin 5 harfli anlamlı bir Türkçe kelime olmak zorunda."
  ls$HowtoplayClues = "Her tahminde, harflerin renklendirilmesiyle bazı ipuçları geliyor: "
  
  ls$GrayColors = "Gri Renkler"
  ls$HowtoplayGrayDesc = " gizli kelimenin o harfi içermediğini, "
  ls$OrangeColors = "Turuncu Renkler"
  ls$HowtoplayOrangeDesc = " gizli kelimenin o harfi içerdiğini ama konumunun yanlış olduğunu, "
  ls$GreenColors = "Yeşil Renkler"
  ls$HowtoplayGreenDesc = "  ise hem gizli kelimenin o harfi içerdiğini, hem de harfin konumunun doğru olduğunu gösteriyor!"
  
  ls$HowtoplayBeforeBrown = "Ek olarak, çetinceviz modundaki "
  ls$BrownColors = "Kahverengi Renkler"
  ls$HowtoplayAfterBrown = " o harfin herhangi bir ipucu vermediği anlamına geliyor."
  
  ls$RestartUpdateButtonLabel = "Kelimeyi Değiştir & Tekrar Oyna"
  
  ls$GameOverNotification = "Oyun bitti. Doğru kelime şuydu:"
  ls$GameIsOverNotification = "Oyun bitti."
  ls$CorrectWordWasNotification = "Doğru kelime şuydu:"
  ls$YourCorrectStreakNotification = "Şuanki eriştiğiniz seri: "
  ls$WordNotFoundNotification = "Kelime sözlükte bulunamadı."
  ls$PleaseEnter5LetterWordNotification = "Lütfen 5 harfli bir kelime giriniz."
  ls$GameOverRestartNotification = "Oyun bitti. Devam etmek için tekrar oynaya tıkla. "
  ls$YouFoundAnswerNotification = "Kelimeyi buldun. "
  ls$RestartedNotification = "Oyun yeniden baslatıldı. "
  ls$WordUpdatedNotification = "Gizli kelime değişti. "
  
  ls$WordFoundComments = c("Şanslısın!", "Dahice!", "Süper!", "Güzeeel!", "İyi iş.", "Fena değil.")
  
  
  return(ls)
}




