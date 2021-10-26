get_stage("install") %>%
  add_step(step_install_cran("dygraphs")) %>%
  add_step(step_install_cran("flexdashboard")) %>%
  add_step(step_install_cran("htmlwidgets")) %>%
  add_step(step_install_cran("knitr")) %>%
  add_step(step_install_cran("tsbox"))%>%
  #add_step(step_install_cran("xts"))%>%
  add_step(step_install_cran("readr"))%>%
  add_step(step_install_cran("dplyr")) %>%
  add_step(step_install_cran("vars")) %>%
  add_step(step_install_cran("ggfortify")) %>%
  add_step(step_install_cran("stargazer")) %>%
  add_step(step_install_cran("forecast")) %>%
  add_step(step_install_cran("plotly")) %>%
  add_step(step_install_cran("ggplot2")) %>%
  add_step(step_install_cran("ggsci")) %>%
  add_step(step_install_cran("tsDyn"))  


get_stage("before_deploy") %>%
  add_step(step_setup_ssh()) %>%
  add_step(step_setup_push_deploy())

get_stage("deploy") %>%
  add_code_step(rmarkdown::render("docs/index.Rmd")) %>%
  add_step(step_do_push_deploy(commit_paths = "docs/index.html"))