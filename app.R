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
  title = div(img(src="nss-logo.png", height=60),
              style = "position: relative; top: -20px; right: 15px;", "R resources"), # Navigation bar
  windowTitle = "NSS R resources", #title for browser tab
      #Style sidebars/well panels
  header = tags$head(tags$style(
      #to avoid red text error messages in the whole app, take out for testing
       ".shiny-output-error { visibility: hidden; }",
       ".shiny-output-error:before { visibility: hidden; }"),
      #External links open a new tab
      HTML("<base target='_blank'>")
      ),
  tabPanel(title = " General", 
           h4("General"),
           p("This page intends to group together resources for analysts using R. We hope this is
    useful both for the begginer and the advanced user. If you have any recommendation
             on links we could add, ", 
             tags$a(href="https://github.com/Health-SocialCare-Scotland/nss-r-resources-app/issues", 
                    "please let us know.")),
           tags$ul( 
             #Link to PHI intro to R
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/Intro%20to%20R-NSS.md", 
                            "Intro to R in the NSS"), 
                     " - An introductory guide to use R in the NSS."),
             #Link to PHI style guide
             tags$li(tags$a(href="https://github.com/Health-SocialCare-Scotland/R-Resources/blob/master/PHI%20R%20style%20guide.md", 
                            "PHI R style guide"), 
                     " - Style guide recommended to use when coding in R."),
             #Link to R official page
             tags$li(tags$a(href="https://www.r-project.org/", "R official page")),
             #Link to RStudio official page
             tags$li(tags$a(href="https://www.rstudio.com/", "RStudio official page")),
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
  tabPanel(title = "Help", 
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
                     " - Community forum for R and RStudio users."),
             #Link to community R Studio
             tags$li(tags$a(href="https://nhsrcommunity.com/", 
                            "NHS-R community"), 
                     " - includes a blog and some resources."),
             #Link to stdha
             tags$li(tags$a(href="http://www.sthda.com/english/", 
                            "Statistical tools for high-throughput data analysis"), 
                     " - Articles, guides on packages, wiki."),
             #Link to R-bloggers
             tags$li(tags$a(href="https://www.r-bloggers.com", 
                            "R-Bloggers"), 
                     " - Blog compilation on R.")
             ),
           h4("Books"),
           tags$ul( 
             #Link to R for data science
             tags$li(tags$a(href="http://r4ds.had.co.nz/", 
                            "R for data science"), " - book on using R for data science."),
             #Link to use R in a nutshell
             tags$li(tags$a(href="https://visualization.sites.clemson.edu/reu/resources/RText.pdf", 
                            "R in a nutshell "), " - reference book on R."),
             #Link to R Cookbook
             tags$li(tags$a(href="http://www.bagualu.net/wordpress/wp-content/uploads/2015/10/R_Cookbook.pdf", 
                            "R Cookbook"), " - reference book on R."),
             #Link to Advanced R
             tags$li(tags$a(href="http://adv-r.had.co.nz/", "Advanced R")),
             #Link to R packages
             tags$li(tags$a(href="http://r-pkgs.had.co.nz/", 
                            "R Packages"), " - book on R packages."),
             #Link to R Inferno
             tags$li(tags$a(href="http://www.burns-stat.com/pages/Tutor/R_inferno.pdf", 
                            "R Inferno"), 
                     " - recopilation of tricks and advice for R common problems."),
             #Link to Efficient R programming
             tags$li(tags$a(href="https://csgillespie.github.io/efficientR/", 
                            "Efficient R programming"), 
                     " - on how to make code faster to type, to run and more scalable..")
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
           )
  ), #Tab panel bracket
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
                     " - Guide to how to connect and extract data from SMRA using R."),
             #Link to tidyr
             tags$li(tags$a(href="https://tidyr.tidyverse.org/", "tidyr"), 
                     " - package useful for changing between wide and long format."),
             #Link to dplyr
             tags$li(tags$a(href="https://dplyr.tidyverse.org/", "dplyr"), 
                     " - package for data manipulation."),
             #Link to dplyr
             tags$li(tags$a(href="https://purrr.tidyverse.org/", "purrr"), 
                     " - package for functional programming.")
           )
  ), #Tab panel bracket
  tabPanel(title = " Data visualization", 
           h4("Data visualization"),
           tags$ul( 
             #Link to R Graphics Cookbook
             tags$li(tags$a(href="http://bioinformaticsonline.com/file/download/29638", 
                            "R Graphics Cookbook"), " - reference to create graphics."),
             #Link to the R gallery
             tags$li(tags$a(href="https://www.r-graph-gallery.com/", "The R graph gallery"), 
                     " - Inspiration and help with R graphics."),
             #Link to ggplot2
             tags$li(tags$a(href="https://ggplot2.tidyverse.org/", "ggplot2"), 
                     " - Package for data visualization."),
             #Link to ggplot2
             tags$li(tags$a(href="https://plot.ly/r/", "plotly"), 
                     " - Package for interative visualizations."),
             #Link to leaflet
             tags$li(tags$a(href="https://rstudio.github.io/leaflet/", "Leaflet"), 
                     " - Package for interactive maps."),
             #Link to top 50 charts ggplot
             tags$li(tags$a(href="http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html", 
                            "Top 50 ggplot2 visualizations"), 
                     " - code and guide on how to plot a wide range of charts using ggplot2.")
           )
  ), #Tab panel bracket
  tabPanel(title = " Shiny", 
           h4("Shiny"),
           tags$ul( 
             #Shiny user group
             tags$li(tags$a(href=" https://docs.google.com/forms/d/1bReJpvTL0UKbXklnQUavUxDcfcDqW47151z4qvfBXuQ/edit#responses", 
                            "Public sector Shiny user group meetings"), 
                     " - If you are interesting in attending you can register for the next one in the link."),
             #Link to R Shiny Tutorial
             tags$li(tags$a(href="http://shiny.rstudio.com/tutorial/", 
                            "Shiny Tutorial")),
             #Link to useful links Shiny
             tags$li(tags$a(href="https://docs.google.com/document/d/1dU4WAneJK8jZ6A9pHcITLvx2dLbnGgkCY7O--LoVsGo/edit", 
                            "Useful links and resources on Shiny")),
             #Link to pres on principles of reactivity
             tags$li(tags$a(href="https://cdn.rawgit.com/rstudio/reactivity-tutorial/master/slides.html#/welcome", 
                            "Principles of reactivity")),
             #Link to pres on principles of reactivity
             tags$li(tags$a(href="http://jasdumas.com/2016-05-14-best-practices-for-shiny-dev/", 
                            "Best practices for Shiny apps development"))
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
           tags$ul( #this section could be a lot more detailed
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