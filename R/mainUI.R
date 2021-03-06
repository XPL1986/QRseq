#' Build shiny UI page
#'
#' @importFrom shinyjs useShinyjs
#' @importFrom shinyWidgets useShinydashboard
#' @importFrom shiny shinyUI fluidPage navbarPage tabPanel icon includeHTML br hr navbarMenu fluidRow strong p tags
#' @importFrom shinyalert useShinyalert
#' @importFrom shinydashboard box
#' @import shinyjs
#'
#' @export
#'
mainUI <- function() {

  jsCode <- jsCode <- "shinyjs.collapse = function(boxid) {
      $('#' + boxid).closest('.box').find('[data-widget=collapse]').click();
  };"

  shinyUI(
    fluidPage(
      style = "width:100%; padding: 0px",

      useShinyalert(),
      useShinydashboard(),

      useShinyjs(),
      extendShinyjs(text = jsCode, functions = "collapse"),

      # use_waiter(),
      # waiter_show_on_load(),
      # waiter_show_on_load(html = spin_ball()), # place at the top before content

      navbarPage(
        id = "mainMenu",
        title = "QRseq",
        theme = "www/style/style.css",
        # footer = includeHTML("footer.html"),
        fluid = TRUE,
        collapsible = TRUE,

        #""
        # ----------------------------------
        # tab panel 1 - Home
        tabPanel(
          "Home", value = "home", icon = icon("home"),
          # style = "margin-left:100px;",
          includeHTML(system.file("shiny",  "myApp/home.html", package = "QRseq")),
          source(system.file("shiny", "myApp/modules/ui-home-introduction.R", package = "QRseq"), local = T)$value,
          br(),hr()
        ),

        # ----------------------------------
        # tab panel 2 - Neighborhood Browser
        tabPanel("Get Start", value = "get_start",
                 source(system.file("shiny", "myApp/modules/1-ui-get-start.R", package = "QRseq"), local = T)$value
        ),

        # ----------------------------------
        # tab panel 3 - Location Comparison
        tabPanel("Design & Run", value = "deseq",
                 source(system.file("shiny", "myApp/modules/2-ui-condition.R", package = "QRseq"),local = T)$value
        ),

        # ----------------------------------
        # tab panel 4 - About
        navbarMenu(
          title = "Quality Assessment",
          tabPanel("PCA", value = "pca", source(system.file("shiny", "myApp/modules/3-ui-pca.R", package = "QRseq"), local = T)$value),
          tabPanel("Hierarchical clustering", value = "hiera", source(system.file("shiny", "myApp/modules/4-ui-hierarchical-cluster.R", package = "QRseq"), local = T)$value),
          tabPanel("Sample to sample distance", value = "dis", source(system.file("shiny", "myApp/modules/5-ui-sample-distance.R", package = "QRseq"), local = T)$value),
          tabPanel("Sample correlation coefficient", value = "cor", source(system.file("shiny", "myApp/modules/6-ui-sample-correlation.R", package = "QRseq"), local = T)$value)
        ),

        navbarMenu(
          title = "Expression Analysis",
          tabPanel("Differential Expression Analysis", value = "dea", source(system.file("shiny", "myApp/modules/7-ui-differential-analysis.R", package = "QRseq"), local = T)$value),
          tabPanel("DEGs Expression Pattern", value = "degsp", source(system.file("shiny", "myApp/modules/8-ui-degs-patterns.R", package = "QRseq"), local = T)$value),
          tabPanel("Expression Visualization", value = "epv", source(system.file("shiny", "myApp/modules/9-ui-expression-visualization.R", package = "QRseq"), local = T)$value)
        ),

        navbarMenu(
          title = "WGCNA",
          tabPanel("1. Creat Data", value = "wgcna-1", source(system.file("shiny", "myApp/modules/10-ui-wgcna-prepare-data.R", package = "QRseq"), local = T)$value),
          tabPanel("2. Module Detection", value = "wgcna-2", source(system.file("shiny", "myApp/modules/11-ui-wgcna-detect-module.R", package = "QRseq"), local = T)$value),
          tabPanel("3. Module-Traits Relationship", value = "wgcna-3", source(system.file("shiny", "myApp/modules/12-ui-wgcna-module-trait.R", package = "QRseq"), local = T)$value)
        ),

        navbarMenu(
          title = "Functional Analysis",
          # tabPanel("ORA analysis"),
          # tabPanel("GSEA analysis"),
          tabPanel("ORA & GSEA", value = "clusterProfiler", source(system.file("shiny", "myApp/modules/13-ui-clusterProfiler.R", package = "QRseq"), local = T)$value),
          tabPanel("g:Profiler API", value = "gProfiler", source(system.file("shiny", "myApp/modules/14-ui-gProfiler.R", package = "QRseq"), local = T)$value)
        ),

        navbarMenu(
          title = "Network Analysis",
          tabPanel("stringDB (PPI)", value = "ppi", source(system.file("shiny", "myApp/modules/15-ui-ppi-network.R", package = "QRseq"), local = T)$value),
          tabPanel("GENIE3 (GRN)", value = "genie3", source(system.file("shiny", "myApp/modules/16-ui-genie3-network.R", package = "QRseq"), local = T)$value)
        ),

        # ----------------------------------
        # tab panel last - About
        tabPanel(
          "FAQ",
          fluidRow(
            style = "margin-left: 10px; margin-right:10px;",
            p("Nothing .....")
          )
        )
      )
    )
  )
}
