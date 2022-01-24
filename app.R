#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(shinytoastr)
library(shinyWidgets)
#library(bslib)
library(shinythemes)

# For tooltips
library(shinyBS) 
library(shinyhelper)


#light <- bs_theme()
#dark <- bs_theme(bg = "black", fg = "white", primary = "purple")

#keyboard <- generateVirtualKeyboard("")

words_all <- read.csv("wordsalpha5.txt", header=F);
words_common <- read.csv("wordscommon5.txt", header=F);


controlButtonStyle = "margin-left: 1px; margin-right: 1px;"

# Define UI for application that draws a histogram
ui <- fluidPage(
    useToastr(),
    useShinyjs(),
    theme = shinytheme("cerulean"),
    #theme = light, 
    #includeCSS("www/darkly.css"),
    #uiOutput("theme_css"),
    #theme = shinytheme("slate"),
  #  theme = shinytheme("cerulean"),
    tags$style(type='text/css', ".container-fluid { padding: 14px; padding-right: 15px; min-height: 0;}"),
   # activateVirtualKeyboard(keyboard),
    
    tags$script(HTML("$(function(){ 
      $(document).keyup(function(e) {
      if (e.which == 65) {$('#buttonA').click() }
      if (e.which == 66) {$('#buttonB').click() }
      if (e.which == 67) {$('#buttonC').click() }
      if (e.which == 68) {$('#buttonD').click() }
      if (e.which == 69) {$('#buttonE').click() }
      if (e.which == 70) {$('#buttonF').click() }
      if (e.which == 71) {$('#buttonG').click() }
      if (e.which == 72) {$('#buttonH').click() }
      if (e.which == 73) {$('#buttonI').click() }
      if (e.which == 74) {$('#buttonJ').click() }
      if (e.which == 75) {$('#buttonK').click() }
      if (e.which == 76) {$('#buttonL').click() }
      if (e.which == 77) {$('#buttonM').click() }
      if (e.which == 78) {$('#buttonN').click() }
      if (e.which == 79) {$('#buttonO').click() }
      if (e.which == 80) {$('#buttonP').click() }
      if (e.which == 81) {$('#buttonQ').click() }
      if (e.which == 82) {$('#buttonR').click() }
      if (e.which == 83) {$('#buttonS').click() }
      if (e.which == 84) {$('#buttonT').click() }
      if (e.which == 85) {$('#buttonU').click() }
      if (e.which == 86) {$('#buttonV').click() }
      if (e.which == 87) {$('#buttonW').click() }
      if (e.which == 88) {$('#buttonX').click() }
      if (e.which == 89) {$('#buttonY').click() }
      if (e.which == 90) {$('#buttonZ').click() }
      if (e.which == 8) {$('#buttonBackspace').click() }
      if (e.which == 13) {$('#buttonEnter').click() }
      if (e.which == 27) {$('#buttonClear').click() }
      });
      })")),

  tags$style(HTML(
    ":root {
    --some-color: black;
    --toast-opacity: 0.8;
    }
    
    #toast-container > div {
    opacity: var(--toast-opacity);
    }
    
    .tabbable > .nav > li[class=active] > a {color: var(--some-color);}
    "
  )),
  
  tags$script(
    "
        // define css theme filepaths
        const themes = {
            dark: 'shinythemes/css/slate.min.css',
            light: 'shinythemes/css/cerulean.min.css'
        }

        // function that creates a new link element
        function newLink(theme) {
            let el = document.createElement('link');
            el.setAttribute('rel', 'stylesheet');
            el.setAttribute('text', 'text/css');
            el.setAttribute('href', theme);
            return el;
        }

        // function that remove <link> of current theme by href
        function removeLink(theme) {
            let el = document.querySelector(`link[href='${theme}']`)
            return el.parentNode.removeChild(el);
        }

        // define vars
        const darkTheme = newLink(themes.dark);
        const lightTheme = newLink(themes.light);
        const head = document.getElementsByTagName('head')[0];
        const toggle = document.getElementById('themeToggle');

        // define extra css and add as default
        const extraDarkThemeCSS = '.dataTables_length label, .dataTables_filter label, .dataTables_info {       color: white!important;} .paginate_button { background: white!important;} thead { color: white;} .tabbable > .nav > li > a { background-color: aqua; }'
        const extraDarkThemeElement = document.createElement('style');
        extraDarkThemeElement.appendChild(document.createTextNode(extraDarkThemeCSS));
        head.appendChild(extraDarkThemeElement);


        // define event - checked === 'light'
        toggle.addEventListener('input', function(event) {
            // if checked, switch to light theme
            if (toggle.checked) {
                removeLink(themes.dark);
                head.removeChild(extraDarkThemeElement);
                head.appendChild(lightTheme);
            }  else {
                // else add darktheme
                removeLink(themes.light);
                head.appendChild(extraDarkThemeElement)
                head.appendChild(darkTheme);
            }
        })
        "
  ),
  
    # Application title
    titlePanel("Wordplay, but Wryly!", "Wryly"),

    tabsetPanel(
        tabPanel("Game",
                 #style = "padding-left: 4px;", 
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            width = 4, 
            style = "padding:4px; padding-left: 2px; padding-right: 2px; margin-bottom: 2px; font-size:8px; margin-left: 0px;",
            uiOutput("buttons"),
            uiOutput("controlButtons")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            uiOutput("test_first_line"),
            fluidRow(
                tags$div(
                    style = "padding: 4px; margin-left: 11px; margin-top: 0px; padding-top: 0px;", 
                    actionButton("buttonRestartRandomize", "Restart & Update Word")
                    #,textInput("text","Write something:"),
                    #,actionButton("buttonReveal", "Reveal")
                    ), 
            )
        )
    )
    
        ),
        tabPanel("How to Play?", 
                 tags$h3("How to Play?", style="font-weight:normal;"),
                 tags$p(style="text-align:justify; margin-bottom: 8px", "There is a hidden 5-letter word, the aim is to find it!"), 
                 tags$p(style="text-align:justify; margin-bottom: 8px", "A total of 6 guesses are allowed. Each guess has to be a meaningful 5-letter english word."),
                 tags$p(style="text-align:justify; margin-bottom: 8px;", "After each guess, a clue is provided based on the coloring of the letters: "), 
                 tags$p(style="text-align:justify; margin-bottom: 4px;", 
                        tags$b("Gray colors", style = "color:#6b6b6b;"), 
                        " indicate that the hidden word doesn't contain the corresponding letter."),
                 tags$p(style="text-align:justify; margin-bottom: 4px;", 
                        tags$b("Orange colors", style = "color:#ff8c00;"), 
                        " indicate that the hidden word contains the corresponding letter, but the positioning of the letter is incorrect."), 
                 tags$p(style="text-align:justify; margin-bottom: 4px;", 
                        tags$b("Green colors", style = "color:limegreen;"), 
                        " indicate that the hidden word contains the corresponding letter, and the positioning of the letter is correct!"), 
                 tags$p(style="text-align:justify; margin-bottom: 4px;", 
                        "Additionally, ", tags$b("Brown colors", style = "color:chocolate;"), 
                        " in hardcore mode indicate that the letter does not provide any clues." ), 
                 
                 
                 
                 ),
    tabPanel("Tips", 
             tags$h3("Some Tips", style="font-weight:normal;"),
             tags$p(style="text-align:justify; margin-bottom: 8px", "For the initial round, OUTER and HOUSE can be good guesses, covering 3 vowels. "), 
             tags$p(style="text-align:justify; margin-bottom: 8px", "A good follow-up can be ALICE or RAINY, covering the remaining two vowels."), 
             tags$p(style="text-align:justify; margin-bottom: 8px", "SYNCH or GLYPH can be good options to test multiple consonants at the same time."), 
            # tags$p(style="text-align:justify; margin-bottom: 8px", "For example, OUTER + SYNCH + PLAID can be a good opening strategy, covering 15 letters."),
             
             tags$p(style="text-align:justify; margin-bottom: 8px", 
                    tags$b("Remember:"), 
                    " There can be more than one copy of the same letter, which happens frequently with vowels. Thus, it can be important to test for multiplicities with guesses like THERE or APPLY. "), 
        ),
    tabPanel("Options", 
             tags$h3("Options", style="font-weight:normal;"),
             tabsetPanel(
               tabPanel("Gameplay",
                selectInput("word_difficulty", "Word difficulty", 
                            choices = list("Impossible" = 2, "Normal" = 1), selected = 1, selectize = F),
                #helper(
                  tags$div(
                  #style = "display: inline-block", 
                  tags$a(id = "hardcore_mode_label", "Hardcore Mode:"),
                  materialSwitch(inputId = "hardcore_mode", label = "", status = "warning", inline = T),
                  tags$b("Enabled", style = "color: orange;", id = "hardcore_enabled_label")
                  #uiOutput("hardcore_enabled_label")
                  ), 
                #type = "markdown", id = "hardcore_mode_tooltip"), 
                bsTooltip(id = "hardcore_mode_label", 
                          title = "In hardcore mode, entering a word that is not in the dictionary still counts as a guess, but provides no clues. "), 
               ),
               tabPanel("Visuals",
                selectInput("anim_speed", "Animation Speed:", 
                            choices = list("Off" = 1, "0.5x" = 2, "1x" = 3, "2x" = 4, "4x" = 5), selected = 3, selectize = F),
                selectInput("night_mode", "Night mode:", 
                           choices = list("Enabled" = 1, "Disabled" = 2), selected = 1, selectize = F)
             ),
             tabPanel("Keyboard",
                selectInput("keyboard_style", "Keyboard Style:", 
                            choices = list("Abcd" = 1, "Qwerty (experimental)" = 2), selected = 2, selectize = F),   
                sliderInput("keyboard_size", "Keyboard Size:", 0.8, 1.5, 1, step = 0.05)
                )
             )
             #tags$h4("Animation", style="font-weight:bold;"),
    )
    
    
    )
)

cs_light <- list(background = "#FCFCFC", selected = "#F5F5CE;", grayclue = "gainsboro", orangeclue = "Orange", greenclue = "lawngreen", noclue = "chocolate")
cs_dark <- list(background = "#FCFCFC", selected = "#F5F5B2", grayclue = "silver", orangeclue = "Orange", greenclue = "lawngreen", noclue = "chocolate")

fox <- function(txt, qwer = T, animTime = 0, colorset = cs_light) {
    bgcolor <- paste("background-color:", colorset$background, ";", sep = "");
    
    #bgcolor <- "background-color:mintcream;";
    
    if(qwer >= 0.75){
      bgcolor <- paste("background-color:", colorset$selected, ";", sep = "");
        #bgcolor <- "background-color:beige;";
    }
    
    if(animTime == 0){
    
    if(qwer == 0.5){
      bgcolor <- paste("background-color:", colorset$selected, ";", sep = "");
    }
      
    if(qwer == 1){
      bgcolor <- paste("background-color:", colorset$grayclue, ";", sep = "");
    }
    
    if(qwer == 2){
        #bgcolor <- "background-color:Tomato;";
      bgcolor <- paste("background-color:", colorset$orangeclue, ";", sep = "");
    }
    
    if(qwer == 3){
      bgcolor <- paste("background-color:", colorset$greenclue, ";", sep = "");
    }
      
    if(qwer == 0.75){
      bgcolor <- paste("background-color:", colorset$noclue, ";", sep = "");
      #bgcolor <- "background-color:beige;";
    }
      
    }
    
   # column(width = 2, 
    tags$div(
        style = "width:64px; height:61px; line-height: 61px; text-align: center; border: 2px solid #000000;",
        style = bgcolor,
        tags$span(txt, style = "text-align: center; font-size: 38px;, display: inline-block; color: black; "),
    )
#    )
}

fox_line <- function(line_values, colorset = cs_light) {
    qwer_values <- line_values$qwer
    txt_values <- line_values$txt
    animTime_values <- line_values$animTime
    tags$div(
        style = "display: flex; margin-left: 15px; text-align: center;",
        fox(txt_values[1], qwer = qwer_values[1], animTime = animTime_values[1], colorset = colorset),
        fox(txt_values[2], qwer = qwer_values[2], animTime = animTime_values[2], colorset = colorset),
        fox(txt_values[3], qwer = qwer_values[3], animTime = animTime_values[3], colorset = colorset),
        fox(txt_values[4], qwer = qwer_values[4], animTime = animTime_values[4], colorset = colorset),
        fox(txt_values[5], qwer = qwer_values[5], animTime = animTime_values[5], colorset = colorset),
    )
}

#
fo_line_init <- function(qwer_val = 0, anim_time = 0){
    #initial_txt <- c("A", "B", "C", "D", "E")
    initial_txt <- c("", "", "", "", "")
    reactiveValues(qwer=seq(qwer_val, qwer_val, length.out = 5), 
                   txt = initial_txt, 
                   animTime = seq(anim_time, anim_time, length.out = 5))
}

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  current_word_list <- reactive({
    switch(as.numeric(input$word_difficulty), words_common, words_all)
  })
  
  foGetRandomWord <- function(word_list=words_common){
    #word_list <- current_word_list()
    #word_list <- words_common
    selected_index <- sample(1:length(word_list[,]), 1, replace=T)
    str <- toupper(word_list[selected_index, ])
  }
  
    source_text <- reactiveVal(foGetRandomWord())
    
    line1 <- fo_line_init(qwer_val = 0.5)
    line2 <- fo_line_init()
    line3 <- fo_line_init()
    line4 <- fo_line_init()
    line5 <- fo_line_init()
    line6 <- fo_line_init()
    
    current_streak <- reactiveVal(0)
    
    current_animation <- reactiveVal(0)
    #animation_speed <- reactiveVal(0.25)
    
    #animationTimer <- reactiveTimer(500)
    
    current_col <- reactiveVal(1)
    current_line <- reactiveVal(1)
    is_ended <- reactiveVal(F)
    is_hardcore_enabled <- reactiveVal(FALSE)
    
    
    animation_speed <- reactive({
      req(input$anim_speed)
      speed <- 0
      switch(as.numeric(input$anim_speed), speed <- 0, speed <- 1, speed <- 0.5, speed <- 0.25, speed <- 0.125)
      return(speed)
    })
    

    
    
    observe({
      #animationTimer()
      if(animation_speed() > 0){
        invalidateLater(animation_speed()*1000, session)
      } else {
        invalidateLater(1000, session)
      }
      isolate(foAnimationTick())
    })
    
    foAnimationTick <- function(){
      anim_speed <- animation_speed()
      if(current_animation() > anim_speed){
        current_animation(current_animation() - anim_speed)
      } else {
        current_animation(0)
      }
      if(current_line() > 0){
        #message("function Run")
        for(j in seq(1, current_line(), 1)){
          line <- foGetLine(j)
          animTime <- line$animTime
          for(i in seq(1, 5, 1)){
            if(animTime[i]>0){
            if(animTime[i]>anim_speed){
              animTime[i] = animTime[i] - anim_speed
            } else{
              animTime[i] = 0
            }
            }
          }
          line$animTime <- animTime
        }
      }
    }
    
    foResetLine <- function(line, qwer_val = 0, animTime = 0){
        line$txt <- c("", "", "", "", "")
        line$qwer <- seq(qwer_val, qwer_val, length.out = 5)
        line$animTime <- seq(animTime, animTime, length.out = 5)
    }
    
    foRestart <- function(src_txt){
        foResetLine(line1, qwer_val = 0.5)
        foResetLine(line2)
        foResetLine(line3)
        foResetLine(line4)
        foResetLine(line5)
        foResetLine(line6)
        current_col(1)
        current_line(1)
        is_ended(F)
        source_text(src_txt)
        current_animation(0)
        is_hardcore_enabled(input$hardcore_mode)
    }
    
    fo <- function(index, myline){
        values <- myline$qwer
        values[index] <- !values[index]
        myline$qwer = values
    }
    
    fou_qwer <- function(qwer, index, myline){
        values <- myline$qwer
        values[index] <- qwer
        myline$qwer = values
    }
    
    fou <- function(txt, index, myline){
        values <- myline$txt
        values[index] <- txt
        myline$txt = values
    }
    
  #  toastr_clear_all <- function(with_animation = FALSE) {
#        #session <- getSession()
 #       session$sendCustomMessage(
 #           type = 'toastr_clear',
 #           message = list(
  #              with_animation = with_animation
 #           )
 #       )
  #  }
    
    fob <- function(buttonIndex){
        buttonVal = buttonValues[buttonIndex]
        cc <- current_col()
        if(cc < 6){
            fou(buttonVal, current_col(), current_line_val())
            current_col(cc+1)
        }
    }
    
    foGetLine <- function(line_index){
      switch(line_index, line1, line2, line3, line4, line5, line6)
    }
    
    
    current_line_val <- reactive({
        foGetLine(current_line())
    })
    
    current_line_txt <- reactive({
        current_line_val()$txt
    })
    
    foFlatten <- function(txt){
        out_list <- list()
        for(c in buttonValues){
            out_list[[c]] = 0
        }
        
        for(i in seq(1, 5, 1)){
            c = substring(txt, i, i)
            out_list[[c]] = out_list[[c]] + 1
        }
        out_list
    }
    
    source_text_flattened <- reactive({
        foFlatten(source_text())
    })
    
    flattened_letters <- reactive({
        out_list <- list()
        for(c in buttonValues){
            out_list[[c]] = 0
        }
        if(current_line() > 1){
        for(j in seq(1, min(current_line(), 6), 1)){
            line_j <- switch(j, line1, line2, line3, line4, line5, line6)
            txt <- line_j$txt
            qwer <- line_j$qwer
            animTime <- line_j$animTime
            
            for(i in seq(1, 5, 1)){
                c = txt[i]
                q = qwer[i]
                if(animTime[i] > 0){
                  next
                }
                if(c != ""){
                    if(q >= 1){
                        out_list[[c]] = max(out_list[[c]], q)
                    }
                }
            }
        }
        }
        out_list
    })
    
    foCheckDictionary <- function(){
        is.element(tolower(paste(current_line_txt(), collapse='')), words_all[,])
    }
    
    foTestAndUpdate <- function(){
        txtB <- current_line_txt()
        src_txt <- source_text()
        src_flt <- source_text_flattened()
        
        qwer_values <- c(1, 1, 1, 1, 1)
        
        for(i in seq(1, 5, 1)){
            c = txtB[i]
            cs = substring(src_txt, i, i)
           # message(c)
            #message(cs)
            if(c == cs){
                src_flt[[c]] = src_flt[[c]] - 1
                qwer_values[i] = 3
            }
        }
        
        initial_delay <- 0.3
        animation_timer <- 0.2
        animTimes <- seq(0, 0, length.out = 5)
        currentTime <- initial_delay
        
        for(i in seq(1, 5, 1)){
            c = txtB[i]
            if(src_flt[[c]] > 0){
                if(qwer_values[i] < 3){
                    src_flt[[c]] = src_flt[[c]] - 1
                    qwer_values[i] = 2
                }
            }
            fou_qwer(qwer_values[i], i, current_line_val())
            animTimes[i] <- currentTime
            currentTime <- currentTime + animation_timer * sqrt(qwer_values[i])
        }
        line <- current_line_val()
        line$animTime <- animation_speed() + seq(0, 4, 1) * animation_speed()
        current_animation(animation_speed() * 6)
        #line$animTime <- animTimes
        
        #current_line_val()$qwer = qwer_values
    }
    
    foHardcoreInvalidate <- function(){
      for(i in seq(1, 5, 1)){
        fou_qwer(0.75, i, current_line_val())
      }
      line <- current_line_val()
      line$animTime <- animation_speed() + seq(0, 4, 1) * animation_speed()
      current_animation(animation_speed() * 6)
    }
    
    
    word_found_comments = c("Lucky!", "Genius!", "Splendid!", "Niceee!", "Good job.", "Not bad.")
    
    focheckCorrectness <- function(){
        txtB <- current_line_txt()
        src_txt <- source_text()
        
        count <- 0;
        for(i in seq(1, 5, 1)){
            c = txtB[i]
            cs = substring(src_txt, i, i)
            if(c == cs){
                count = count + 1;
            }
        }
        return(count == 5)
    }
    
    #theme_css <- renderUI({
    #  includeCSS("www/darkly.css")
    #})
    
    observeEvent(input$night_mode, {
      if(input$night_mode == 1){
        runjs(" removeLink(themes.light);
                  head.appendChild(darkTheme);
                  head.appendChild(extraDarkThemeElement);")
        runjs("document.body.style.color = 'white'")
        runjs("document.documentElement.style.setProperty('--some-color', '#16F529');")
        runjs("document.documentElement.style.setProperty('--toast-opacity', 0.97);")
      } else {
        runjs(" removeLink(themes.dark);
                head.removeChild(extraDarkThemeElement);
                head.appendChild(lightTheme);")
        runjs("document.documentElement.style.setProperty('--some-color', 'Black');")
        runjs("document.body.style.color = 'black'")
        runjs("document.documentElement.style.setProperty('--toast-opacity', 0.8);")
        #runjs("document.body.style.backgroundColor = 'black';")
      }
      foUpdateHardcoreLabel()
    })
    
    foLoseGame <- function(){
      is_ended(T)
      delay(animation_speed() * 5000 + 1, toastr_error("Game is over"))
      delay(250 + animation_speed() * 5500 + 1, toastr_error(paste("The correct word was:", source_text()), closeButton = T, timeOut = 50000, extendedTimeOut = 50000))
      if(current_streak() > 1){
        strk <- current_streak()
        delay(500 + animation_speed() * 6000 + 1, toastr_error(paste("You have achieved streak: ", as.character(strk)), closeButton = T, timeOut = 3000, extendedTimeOut = 3000))
        current_streak(0)
      }
    }
    
    foEnter <- function(){
        if(current_animation() > 0){
          return()
        }
        cc <- current_col()
        cl <- current_line()
        if(!is_ended()){
            if(cc >= 6){
                if(foCheckDictionary()){
                    foTestAndUpdate()
                    
                    if(!focheckCorrectness()){
                    
                        if(cl < 6){
                            current_line(cl + 1)
                            current_col(1)
                            cl <- current_line_val()
                            cl$qwer <- seq(0.5, 0.5, length.out=5)
                            cl$animTime <- seq(6, 6, length.out=5) * animation_speed()
                        } else { 
                            # End game
                            foLoseGame()
                        }
                    } else { # Found the answer
                        current_streak(current_streak() + 1)
                        is_ended(T)
                        delay(animation_speed() * 5000 + 1, toastr_success("You found the answer. "))
                        delay(250 + animation_speed() * 5500 + 1, toastr_success(word_found_comments[cl]))
                        if(current_streak() > 1){
                          delay(500 + animation_speed() * 6000 + 1, toastr_success(paste("Your current streak is: ", as.character(current_streak()))))
                        }
                    }
                } else {
                    if(!is_hardcore_enabled()){
                      message("Not a member")
                      toastr_warning("Word not found in the dictionary.")
                    } else { # Switch to the next line
                      foHardcoreInvalidate()
                      delay(animation_speed() * 4500 + 1, toastr_error("Word not found in the dictionary."))
                      if(cl < 6){
                        current_line(cl + 1)
                        current_col(1)
                        cl <- current_line_val()
                        cl$qwer <- seq(0.5, 0.5, length.out=5)
                        cl$animTime <- seq(6, 6, length.out=5) * animation_speed()
                      } else {
                        foLoseGame()
                      }
                    }
                }
            } else {
                toastr_info("Please enter a 5 letter word.")
            }
        } else {
            toastr_info("Game is over. Click restart to play again. ")
        }
    }
    
    foBackspace <- function(){
        cc <- current_col()
        if(!is_ended()){
        if(cc > 1){
            fou("", cc - 1, current_line_val())
            current_col(cc - 1)
        }
        }
    }
    
    foClear <- function(){
        cc <- current_col()
        if(!is_ended()){
            while (cc > 1) {
                fou("", cc - 1, current_line_val())
                cc <- cc - 1
            }
            current_col(1)
        }
    }
    
    buttonValues = c("A", "B", "C", "D", "E", "F", "G", "H", "I", 
                     "J", "K", "L", "M", "N", "O", "P", "Q", "R", 
                     "S", "T", "U", "V", "W", "X", "Y", "Z")
    
    #foRandomizeSource <- function(){
    #    str <- foGetRandomWord()
    #    foRestart(str)
    #}
    
    foRestartRandomize <- function(word_list){
        #indices <- sample(1:length(buttonValues), 5, replace=T)
        str <- foGetRandomWord(word_list)
        #selected_index <- sample(1:length(words_common[,]), 1, replace=T)
        #str <- toupper(words_common[selected_index, ])
        #str <- ""
        #for(i in seq(1, 5, 1)){
        #    str = paste(str, buttonValues[indices[i]], sep="")
        #}
        message(str)
        foRestart(str)
        #toastr.clear()
        #toastr_clear_all(with_animation = F)
        toastr_success("Successfully restarted.")
        toastr_success("The target word is updated. ")
    }
    

    
    # A = 1
    # B = 2
    # C = 3
    # D = 4
    # E = 5 
    # F = 6
    # G = 7
    # H = 8
    # I = 9
    # J = 10
    # K = 11
    # L = 12
    # M = 13
    # N = 14
    # O = 15
    # P = 16
    # Q = 17
    # R = 18
    # S = 19
    # T = 20
    # U = 21
    # V = 22
    # W = 23
    # X = 24
    # Y = 25
    # Z = 26
    
    foReveal <- function(){
        #is_ended(T)
        toastr_error(paste("Game is over. The correct word was:", source_text()))
    }
    
    observeEvent(input$buttonEnter, { foEnter() })
    observeEvent(input$buttonBackspace, { foBackspace() })
    observeEvent(input$buttonClear, { foClear() })
    observeEvent(input$buttonRestartRandomize, { foRestartRandomize(current_word_list()) })
    observeEvent(input$buttonReveal, { foReveal() })
    
    observeEvent(input$buttonA, { fob(1) })
    observeEvent(input$buttonB, { fob(2) })
    observeEvent(input$buttonC, { fob(3) })
    observeEvent(input$buttonD, { fob(4) })
    observeEvent(input$buttonE, { fob(5) })
    observeEvent(input$buttonF, { fob(6) })
    observeEvent(input$buttonG, { fob(7) })
    observeEvent(input$buttonH, { fob(8) })
    observeEvent(input$buttonI, { fob(9) })
    observeEvent(input$buttonJ, { fob(10) })
    observeEvent(input$buttonK, { fob(11) })
    observeEvent(input$buttonL, { fob(12) })
    observeEvent(input$buttonM, { fob(13) })
    observeEvent(input$buttonN, { fob(14) })
    observeEvent(input$buttonO, { fob(15) })
    observeEvent(input$buttonP, { fob(16) })
    observeEvent(input$buttonQ, { fob(17) })
    observeEvent(input$buttonR, { fob(18) })
    observeEvent(input$buttonS, { fob(19) })
    observeEvent(input$buttonT, { fob(20) })
    observeEvent(input$buttonU, { fob(21) })
    observeEvent(input$buttonV, { fob(22) })
    observeEvent(input$buttonW, { fob(23) })
    observeEvent(input$buttonX, { fob(24) })
    observeEvent(input$buttonY, { fob(25) })
    observeEvent(input$buttonZ, { fob(26) })
    
    #observeEvent(input$b2, { fo(2, line1) })
    #observeEvent(input$b3, { fo(3, line2) })
    
    current_colorset <- reactive({
      switch(as.numeric(input$night_mode), cs_dark, cs_light)
    })
    
    current_keyboardsize <- reactive({
      as.numeric(input$keyboard_size)
    })
    
    output$test_first_line <- renderUI({
        div_hardcore <- tags$div(style = "height:8px;")
        if(is_hardcore_enabled()){
          div_hardcore <- tags$div(
            style = "display: table; margin-left: 128px;", 
            tags$strong("Hardcore Mode!", style = "color: #FE8110;"), 
          )
        }
        fluidRow(
            div_hardcore, 
            fox_line(line1, current_colorset()),
            fox_line(line2, current_colorset()),
            fox_line(line3, current_colorset()),
            fox_line(line4, current_colorset()),
            fox_line(line5, current_colorset()),
            fox_line(line6, current_colorset()),
            tags$p("", style ="height:6px;")
        )
    })
    
    
    
    foActionButton <- function(buttonId, buttonTxt){
        colorset <- current_colorset()
        size_multiplier  <- current_keyboardsize()
      
        flt_letter <- flattened_letters()
        qwer <- flt_letter[[buttonTxt]]
        bgcolor <- paste("background:", colorset$background, ";", sep = "");
        if(qwer == 1){
            bgcolor <- paste("background:", colorset$grayclue, ";", sep = "");
        }
        
        if(qwer == 2){
            #bgcolor <- "background-color:Tomato;";
            bgcolor <- paste("background:", colorset$orangeclue, ";", sep = "");
        }
        
        if(qwer == 3){
            bgcolor <- paste("background:", colorset$greenclue, ";", sep = "");
        }
        
        if(input$keyboard_style == 2){
          padding = 6 * size_multiplier
          min_width = 28 * size_multiplier
        } else {
          padding = 9 * size_multiplier
          min_width = 31 * size_multiplier
        }
        
        font_size = 20 * size_multiplier
        
        padding_style = paste("padding: ", padding, "px;", sep = "") 
        padding_all = paste(padding_style, "padding-top: 6px; padding-bottom: 6px;", sep = "")
        
        min_width_txt = paste("min-width: ", min_width, "px;", sep = "") 
        font_size_txt = paste("font-size: ", font_size, "px;", sep = "") 
        
        actionButton(buttonId, buttonTxt, style = bgcolor, style = "color: #333333;", 
                     style = "margin-bottom: 2px; margin-top:2px; margin-left: 1px; margin-right: 1px;",
                     style = padding_all, 
                     style = font_size_txt,
                     style = min_width_txt)
    }
    
    output$controlButtons <- renderUI({
      if(input$keyboard_style == 1){
        size_multiplier  <- current_keyboardsize()
        font_size = 14 * size_multiplier
        font_size_txt = paste("font-size: ", font_size, "px;", sep = "") 
        ctr_style_extra = font_size_txt
        tags$div(
          style = "margin: 0px;", 
          actionButton("buttonEnter", "Enter", stype = controlButtonStyle, style = ctr_style_extra),
          actionButton("buttonBackspace", "Backspace", style = controlButtonStyle, style = ctr_style_extra),
          actionButton("buttonClear", "Clear", style = controlButtonStyle, style = ctr_style_extra)
        ) 
      } else {
          tags$div(
            style = "display: table; margin:0 auto;", 
            actionButton("buttonEnter", "Enter", stype = controlButtonStyle),
            actionButton("buttonBackspace", "Backspace", style = controlButtonStyle),
            actionButton("buttonClear", "Clear", style = controlButtonStyle),
          )
      }
    })
    
    
    
    foUpdateHardcoreLabel <- function(){
      if(input$hardcore_mode == T){
        runjs("document.getElementById('hardcore_enabled_label').innerHTML = 'Enabled';")
        #runjs("document.getElementById('hardcore_mode_label').style.color = 'orange';")
        #runjs("document.getElementById('hardcore_mode_label').style.fontWeight = 'bold';")
      } else {
        runjs("document.getElementById('hardcore_enabled_label').innerHTML = '';")
       # runjs("document.getElementById('hardcore_mode_label').style.color = document.body.style.color;")
        #runjs("document.getElementById('hardcore_mode_label').style.fontWeight = 'normal';")
      }
      is_hardcore_enabled(input$hardcore_mode)
    }
    
    observeEvent(input$hardcore_mode, { foUpdateHardcoreLabel() })
    
  #  output$hardcore_enabled_label <- renderUI({
  #    if(input$hardcore_mode == T)
  #      tags$div(
  #        style = "display: inline-block;",
  #        tags$b("Enabled", style = "color: red;")
  #      )
   # })
    
    output$buttons <- renderUI({
        req(flattened_letters())
        if(input$keyboard_style == 1){
        tags$div(
            #style = "margin:0px; padding: 0px;", 
            style = "display: table; margin:0 auto;", 
            foActionButton("buttonA", "A"),
            foActionButton("buttonB", "B"),
            foActionButton("buttonC", "C"),
            foActionButton("buttonD", "D"),
            foActionButton("buttonE", "E"),
            foActionButton("buttonF", "F"),
            foActionButton("buttonG", "G"),
            foActionButton("buttonH", "H"),
            foActionButton("buttonI", "I"),
            foActionButton("buttonJ", "J"),
            foActionButton("buttonK", "K"),
            foActionButton("buttonL", "L"),
            foActionButton("buttonM", "M"),
            foActionButton("buttonN", "N"),
            foActionButton("buttonO", "O"),
            foActionButton("buttonP", "P"),
            foActionButton("buttonQ", "Q"),
            foActionButton("buttonR", "R"),
            foActionButton("buttonS", "S"),
            foActionButton("buttonT", "T"),
            foActionButton("buttonU", "U"),
            foActionButton("buttonV", "V"),
            foActionButton("buttonW", "W"),
            foActionButton("buttonX", "X"),
            foActionButton("buttonY", "Y"),
            foActionButton("buttonZ", "Z")
        )
        } else {
          tags$div(
            style = "margin:0px; padding: 0px;", 
            tags$div(
              style = "display: table; margin:0 auto;", 
              #style = "margin:0px; padding: 0px;", 
              foActionButton("buttonQ", "Q"),
              foActionButton("buttonW", "W"),
              foActionButton("buttonE", "E"),
              foActionButton("buttonR", "R"),
              foActionButton("buttonT", "T"),
              foActionButton("buttonY", "Y"),
              foActionButton("buttonU", "U"),
              foActionButton("buttonI", "I"),
              foActionButton("buttonO", "O"),
              foActionButton("buttonP", "P")
            ),
            tags$div(
              style = "display: table; margin:0 auto;", 
              foActionButton("buttonA", "A"),
              foActionButton("buttonS", "S"),
              foActionButton("buttonD", "D"),
              foActionButton("buttonF", "F"),
              foActionButton("buttonG", "G"),
              foActionButton("buttonH", "H"),
              foActionButton("buttonJ", "J"),
              foActionButton("buttonK", "K"),
              foActionButton("buttonL", "L"),
            ),
            tags$div(
              #style = "margin:0px; padding: 0px;", 
              style = "display: table; margin:0 auto;", 
              foActionButton("buttonZ", "Z"),
              foActionButton("buttonX", "X"),
              foActionButton("buttonC", "C"),
              foActionButton("buttonV", "V"),
              foActionButton("buttonB", "B"),
              foActionButton("buttonN", "N"),
              foActionButton("buttonM", "M")
            )
          )
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
