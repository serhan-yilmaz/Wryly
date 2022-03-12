
options(encoding="UTF-8")
Sys.setlocale(category = "LC_ALL", locale = "Turkish")

language_set_tr <- function(){
  ls <- list()
  ls$TitleText = "Wordle, ama Türkçe!"
  ls$TitleBrowser = "Türkçe Wryly!"
  ls$MainTabGame =  "Oyun"
  ls$MainTabHowToPlay = "Nasıl oynanır?"
  ls$MainTabTips = "Tüyolar"
  ls$MainTabOptions = "Seçenekler"
  ls$HowtoplayTabBasics = "Temel Bilgiler"
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
  ls$KeyboardStyleQwerty = "Qwerty"
  ls$KeyboardStyleAbcd = "Abcd"
  ls$KeyboardSizeLabel = "Klavye Boyutu:"
  ls$KeyboardHorizontalMargin = "Yatay Bosluk:"
  ls$KeyboardVerticalMargin = "Dikey Bosluk:"
  ls$AnimationSpeedLabel = "Animasyon Hızı:"
  ls$AnimationSpeedOff = "Kapalı"
  ls$NightModeLabel = "Gece modu:"
  ls$NightModeEnabled = "Aktif"
  ls$NightModeDisabled = "Devre dışı"
  #ls$ColorblindModeLabel = "Renk körü modu:"
  #ls$ColorblindModeEnabled = "Aktif"
  #ls$ColorblindModeDisabled = "Deaktif"
  ls$ColorblindModeLabel = "Renk paleti:"
  ls$ColorblindModeEnabled = "Renk körü dostu"
  ls$ColorblindModeDisabled = "Orijinal (Turuncu/Yeşil)"
  
  ls$HowtoplayAim = "Gizli 5 harfli bir kelime var, amacımız tahminler yaparak o kelimeyi bulmak!"
  ls$HowtoplayGuesses = "Toplam 6 tahmin hakkı var ve her tahmin 5 harfli anlamlı bir Türkçe kelime olmak zorunda."
  ls$HowtoplayClues = "Her tahminde, harflerin renklendirilmesiyle bazı ipuçları geliyor: "
  
  ls$GrayColors = "Gri Renkler"
  ls$HowtoplayGrayDesc = " gizli kelimenin o harfi içermediğini, "
  ls$OrangeColors = "Turuncu Renkler"
  ls$ColorblindOrangeColors = "Sarı Renkler"
  ls$HowtoplayOrangeDesc = " gizli kelimenin o harfi içerdiğini ama konumunun yanlış olduğunu, "
  ls$GreenColors = "Yeşil Renkler"
  ls$ColorblindGreenColors = "Mavi Renkler"
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
  ls$HiddenWordWasNotification = "Gizli kelime şuydu:"
  
  ls$WordFoundComments = c("Şanslısın!", "Dahice!", "Süper!", "Güzeeel!", "İyi iş.", "Fena değil.")
  
  ls$TipsInitialRound = "İlk tur için KAİDE 3 sesli harfi kapsayan, iyi bir seçenek olabilir."
  ls$TipsFollowup = "Devamında, ÇÖZÜM ya da TORUN iyi seçenekler olabilir, geriye kalan 2 sesli harfi daha kapsayan."
 # ls$TipsAdditional = "İlk sesli harfi yakaladıktan sonra geri kalanları bulabilmek için büyük ünlü uyumunu hesaba katmak yararlı olabilir. Mesela A harfiden sonra I, O ya da U'yu test etmek gibi."
    ls$TipsAdditional = "Tahminlerde Büyük Ünlü Uyumunu dikkate almak önemli. Fakat, KÜLOT gibi buna uymayan kelimelerin de var olduğu unutulmamalı."
  ls$TipsRememberLabel = "Hatırlatma:"
  ls$TipsRememberText = " Bir kelimede birden fazla aynı harften bulunabilir ki bu özellikle sesli harfler için yaygın bir durum. O yüzden, KAPAK ya da CACIK gibi tahminlerle bu tarz tekrarları test etmek önemli olabilir. "
  
  
  
  return(ls)
}




