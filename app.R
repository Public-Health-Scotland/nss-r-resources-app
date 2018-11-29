# Description - App to host resources on R for NHS analysts

#TODO:
#add key ebooks?
#Think about layout. What about different tabs or one page with a filter?
#if not I might want a table of contents

###############################################.
## Global  ----
###############################################.
# this section includes the non-reactive elements and everything used by both the
# UI and Server sides: functions, packages, data
library(shiny)
library(shinythemes)

###############################################.
## UI  ----
###############################################.
# User interface - how your app looks
ui <- navbarPage(
  theme = shinytheme("flatly"), #Theme of the app 
  title = "NSS R resources", # Navigation bar
  windowTitle = "NSS R resources", #title for browser tab
      #Style sidebars/well panels
  header = tags$head(tags$style(
      #to avoid red text error messages in the whole app, take out for testing
       ".shiny-output-error { visibility: hidden; }",
       ".shiny-output-error:before { visibility: hidden; }"),
      #External links open a new tab
      HTML("<base target='_blank'>")
      ),
  tabPanel(title = " Version 1", icon = icon("home"),
  p("This page intends to group together resources for analysts using R. We hope this is
    useful both for the begginer and the advanced user. If you have any recommendation 
    on links we could add, please let us know here (link to github issues?)"),
  h4("General"),
  tags$ul( 
    #Link to PHI intro to R
    tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/Intro%20to%20R-NSS.md", 
                   "Intro to R in the NSS"), 
            " - An introductory guide to use R in the NSS."),
    #Link to PHI style guide
    tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/PHI%20R%20style%20guide.md", 
                                       "PHI R style guide"), 
            " - Style guide recommended to use when coding in R."),
    #Link to PHI style guide
    tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications/resources/blob/master/R.md", 
                   "R resources"), 
            " - some extra resources compiled by the Transforming Publications team."),
    #Link to cheatsheets
    tags$li(tags$a(href="https://www.rstudio.com/resources/cheatsheets/", 
                   "Cheatsheets"), " - useful summaries of packages' commands."),
    #blank project structures
    tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/r-project-structure", 
                   "R project "), "and ", 
            tags$a(href="https://github.com/Health-SocialCare-Scotland/rshiny-project-structure", 
                    "R Shiny project "),
            "- blank project templates to help you organize your work.")
  ),
  h4("Learning"),
  tags$ul( 
    #Link to datacamp
    tags$li(tags$a(href="https://www.datacamp.com/", "Data camp")),
    #Link to coursera
    tags$li(tags$a(href="https://www.coursera.org/learn/r-programming", 
                   "Coursera")),
    #Link to coursera
    tags$li(tags$a(href="http://www.neonscience.org/resources/data-tutorials", 
                   "Neonscience")),
    #Link to coursera
    tags$li(tags$a(href="https://www.udacity.com/course/data-analysis-with-r--ud651", 
                   "Udacity")),
    #Link to coursera
    tags$li(tags$a(href="https://www.rstudio.com/online-learning/", 
                   "RStudio compilation of resources."))
  ),
  h4("Ask for help"),
  tags$ul( #need link to rgov slack?
    #Link to data science slack
    tags$li(tags$a(href="https://datasciencescotland.slack.com", 
                   "Data science Scotland slack"), 
            " - Chat space about data science in the public sector of Scotland. 
            It hosts r and r shiny channels."),
   #Code clubs - need to add a contact or something like that
    tags$li("There are ", tags$b("code clubs"), " meetings every two weeks both in Meridian and the Gyle,
            where you can meet other R users and obtain help."),
    #Link to use PHI user group
    tags$li(tags$a(href="mailto:Nss.rusergroup@nhs.net", 
                   "PHI R user group "), 
            " - distribution list of R users who might be able to help you."),
    #Link to stackoverflow
    tags$li(tags$a(href="https://stackoverflow.com/questions/tagged/r", 
                   "Stackoverflow"), 
            " - Site for questions about coding and programming including R."),
   #Link to community R Studio
   tags$li(tags$a(href="https://community.rstudio.com/", 
                  "Community RStudio"), 
           " - Community forum for R and RStudio users.")
  ),
  h4("Data wrangling and analysis"),
  tags$ul( 
    #Link to accesing web APIs from R
    tags$li(tags$a(href="https://github.com/jsphdms/R_web_APIs", 
                   "Accesing web APIs from R"), 
            " - guide on how to extract data using APIs using R."),
    #Link to use SMRA with R
    tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/using%20SMRA%20with%20R.md", 
                   "Using SMRA with R"), 
            " - Guide to how to connect and extract data from SMRA using R.")
  ),
  #reshape, tidyverse helps
  h4("Data visualization"),
  #ggplot
  h4("Shiny"),
  tags$ul( 
    #Shiny user group
    tags$li(tags$a(href=" https://docs.google.com/forms/d/1bReJpvTL0UKbXklnQUavUxDcfcDqW47151z4qvfBXuQ/edit#responses", 
                   "Public sector Shiny user group meetings"), 
            " - If you are interesting in attending you can register for the next one in the link."),
    #Link to useful links Shiny
    tags$li(tags$a(href="https://docs.google.com/document/d/1dU4WAneJK8jZ6A9pHcITLvx2dLbnGgkCY7O--LoVsGo/edit", 
                   "Useful links and resources on Shiny"))
  ),
  h4("Version control"),
  tags$ul( 
    #Link to tpp github guidance
    tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications/GitHub-guidance", 
                   "GitHub guidance"), 
            " - developed by the transforming publication team."),
    #Link to happygitwithr
    tags$li(tags$a(href="http://happygitwithr.com/", 
                   "Happy Git and GitHub for the useR"), 
            " - book on how to use Git and GitHub with R.")
    ),
  h4("Code examples"),
  tags$ul( 
    #Link to PHI github
    tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/", 
                   "PHI GitHub")),
    #Link to PHI github
    tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications", 
                   "Transforming Publications GitHub")),
  #Link to PHI github
  tags$li(tags$a(href="https://github.com/ScotPHO", 
                 "ScotPHO GitHub"))
    )
  ),#Tab panel bracket
  tabPanel(title = " General", 
           h4("General"),
           p("This page intends to group together resources for analysts using R. We hope this is
            useful both for the begginer and the advanced user. If you have any recommendation 
             on links we could add, please let us know here (link to github issues?)"),
           tags$ul( 
             #Link to PHI intro to R
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/Intro%20to%20R-NSS.md", 
                            "Intro to R in the NSS"), 
                     " - An introductory guide to use R in the NSS."),
             #Link to PHI style guide
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/PHI%20R%20style%20guide.md", 
                            "PHI R style guide"), 
                     " - Style guide recommended to use when coding in R."),
             #Link to PHI style guide
             tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications/resources/blob/master/R.md", 
                            "R resources"), 
                     " - some extra resources compiled by the Transforming Publications team."),
             #Link to cheatsheets
             tags$li(tags$a(href="https://www.rstudio.com/resources/cheatsheets/", 
                            "Cheatsheets"), " - useful summaries of packages' commands."),
             #blank project structures
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/r-project-structure", 
                            "R project "), "and ", 
                     tags$a(href="https://github.com/Health-SocialCare-Scotland/rshiny-project-structure", 
                            "R Shiny project "),
                     "- blank project templates to help you organize your work.")
           )
  ), #Tab panel bracket
  tabPanel(title = " Learning",
           h4("Learning"),
           tags$ul( 
             #Link to datacamp
             tags$li(tags$a(href="https://www.datacamp.com/", "Data camp")),
             #Link to coursera
             tags$li(tags$a(href="https://www.coursera.org/learn/r-programming", 
                            "Coursera")),
             #Link to coursera
             tags$li(tags$a(href="http://www.neonscience.org/resources/data-tutorials", 
                            "Neonscience")),
             #Link to coursera
             tags$li(tags$a(href="https://www.udacity.com/course/data-analysis-with-r--ud651", 
                            "Udacity")),
             #Link to coursera
             tags$li(tags$a(href="https://www.rstudio.com/online-learning/", 
                            "RStudio compilation of resources."))
           )
  ), #Tab panel bracket
  tabPanel(title = " Ask for help", 
           h4("Ask for help"),
           tags$ul( #need link to rgov slack?
             #Link to data science slack
             tags$li(tags$a(href="https://datasciencescotland.slack.com", 
                            "Data science Scotland slack"), 
                     " - Chat space about data science in the public sector of Scotland. 
                     It hosts r and r shiny channels."),
             #Code clubs - need to add a contact or something like that
             tags$li("There are ", tags$b("code clubs"), " meetings every two weeks both in Meridian and the Gyle,
                     where you can meet other R users and obtain help."),
             #Link to use PHI user group
             tags$li(tags$a(href="mailto:Nss.rusergroup@nhs.net", 
                            "PHI R user group "), 
                     " - distribution list of R users who might be able to help you."),
             #Link to stackoverflow
             tags$li(tags$a(href="https://stackoverflow.com/questions/tagged/r", 
                            "Stackoverflow"), 
                     " - Site for questions about coding and programming including R."),
             #Link to community R Studio
             tags$li(tags$a(href="https://community.rstudio.com/", 
                            "Community RStudio"), 
                     " - Community forum for R and RStudio users.")
             )
  ),
  tabPanel(title = " Wrangling and analysis", 
           h4("Data wrangling and analysis"),
           tags$ul( 
             #Link to accesing web APIs from R
             tags$li(tags$a(href="https://github.com/jsphdms/R_web_APIs", 
                            "Accesing web APIs from R"), 
                     " - guide on how to extract data using APIs using R."),
             #Link to use SMRA with R
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/using%20SMRA%20with%20R.md", 
                            "Using SMRA with R"), 
                     " - Guide to how to connect and extract data from SMRA using R.")
           )
  ), #Tab panel bracket
  tabPanel(title = " Data visualization", 
           h4("Data visualization")
  ), #Tab panel bracket
  tabPanel(title = " Shiny", 
           h4("Shiny"),
           tags$ul( 
             #Shiny user group
             tags$li(tags$a(href=" https://docs.google.com/forms/d/1bReJpvTL0UKbXklnQUavUxDcfcDqW47151z4qvfBXuQ/edit#responses", 
                            "Public sector Shiny user group meetings"), 
                     " - If you are interesting in attending you can register for the next one in the link."),
             #Link to useful links Shiny
             tags$li(tags$a(href="https://docs.google.com/document/d/1dU4WAneJK8jZ6A9pHcITLvx2dLbnGgkCY7O--LoVsGo/edit", 
                            "Useful links and resources on Shiny"))
           )
  ), #Tab panel bracket
  tabPanel(title = " Version control", 
           h4("Version control"),
           tags$ul( 
             #Link to tpp github guidance
             tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications/GitHub-guidance", 
                            "GitHub guidance"), 
                     " - developed by the transforming publication team."),
             #Link to happygitwithr
             tags$li(tags$a(href="http://happygitwithr.com/", 
                            "Happy Git and GitHub for the useR"), 
                     " - book on how to use Git and GitHub with R.")
           )
  ), #Tab panel bracket
  tabPanel(title = " Code", 
           h4("Code examples"),
           tags$ul( 
             #Link to PHI github
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/", 
                            "PHI GitHub")),
             #Link to PHI github
             tags$li(tags$a(href="https://github.com/NHS-NSS-transforming-publications", 
                            "Transforming Publications GitHub")),
             #Link to PHI github
             tags$li(tags$a(href="https://github.com/ScotPHO", 
                            "ScotPHO GitHub"))
           )
  ) #Tab panel bracket
)#Navbar page bracket

###############################################.
## Server  ----
###############################################.
# Part of the code that produces the outputs: charts, text, etc
server <- function(input, output, session) {
  
}


shinyApp(ui, server) # calling the app 