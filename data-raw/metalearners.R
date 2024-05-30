library(tidyverse)

metric_files <- list.files(here::here("data-raw/metrics"), full.names = TRUE)

get_object <- function(x) {
  env <- new.env()
  nm <- load(x, env)[1]
  env[[nm]]
}

metalearners <- lapply(metric_files, get_object)
metalearners <- bind_rows(metalearners) %>% unnest(metric)
metalearners <-
  metalearners %>%
  mutate(recipe = if_else(recipe == "basic", "minimal", recipe)) %>%
  mutate(meta_learner = paste0(recipe, "_", spec))

# most all of the bagged MARS models ran out of memory and did not tune
table(metalearners$meta_learner)
metalearners <- filter(metalearners, !spec == "bm")

metalearners

metalearners <- metalearners %>%
  mutate(
    recipe = case_when(
      recipe == "minimal" ~ "Minimal",
      recipe == "normalize" ~ "Center + Scale",
      recipe == "pca" ~ "Principal Component Analysis",
      recipe == "renormalize" ~ "C+S, PCA, C+S"
    ),
    spec = case_when(
      spec == "glmnet" ~ "GLM (glmnet)",
      spec == "lgb" ~ "Boosted Tree (lightgbm)",
      spec == "xgb" ~ "Boosted Tree (xgboost)",
      spec == "bt" ~ "Bagged Tree (rpart)",
      spec == "nn" ~ "Neural Network (nnet)",
      spec == "svm" ~ "Support Vector Machine (kernlab)"
    )
  ) %>%
  select(
    task = dataset,
    meta_learner,
    recipe,
    specification = spec,
    elapsed = time_to_fit,
    metric = .metric,
    estimate = .estimate,
    estimator = .estimator
  ) %>%
  mutate(across(c(task, meta_learner, recipe, specification), as.factor))

usethis::use_data(metalearners, overwrite = TRUE)
