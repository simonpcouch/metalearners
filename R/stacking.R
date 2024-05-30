#' Data on model metalearners experiments
#'
#' @description
#' `metalearners` arose from a set of experiments intended to benchmark the
#' time-to-fit and predictive performance of a number of alternative model
#' stacking methods (or "meta-learners") for use in the \pkg{stacks} package.
#' Each row in the data represents a unique combination of task, proposed
#' meta-learner (as recipe + specification), and performance metric. The
#' meta-learner `minimal_glmnet` is the existing meta-learner, and the
#' remaining entries represent alternative meta-learners to be compared to
#' `minimal_glmnet`.
#'
#' @details
#' Every `meta_learner` was evaluated against every `task`. That said, a number
#' of meta-learners failed to train on a given task, usually due to memory
#' exhaustion, and those failed experiments are not represented in the data.
#'
#' Each experiment was carried out on a 24-core machine with 64GB memory
#' running Linux Ubuntu 24.04. Computations were distributed using forking with
#' 5 cores (except for tasks `caret` and `nhl`, which used 2 cores.)
#'
#' @format ## `metalearners`
#' A data frame with 217 rows and 8 columns:
#' \describe{
#'   \item{task}{Factor. A descriptor of a modeling task, i.e. a dataset.}
#'   \item{meta_learner}{Factor. An ID for the proposed meta-learner.
#'     A proposed meta-learner is made by pairing a `recipe` with a model
#'     `specification`.}
#'   \item{recipe}{Factor. The recipe used to preprocess the data stack.
#'     See the `meta_learners` folder in the linked repository for
#'     implementation.}
#'   \item{specification}{Factor. The model specification used to model the
#'     data stack. See the `meta_learners` folder in the linked repository for
#'     implementation.}
#'   \item{elapsed}{Numeric. The elapsed time to tune the
#'     meta-learner against resamples, in seconds. In "real" time rather than
#'     CPU time.}
#'   \item{metric}{Character. The type of performance metric, as returned by
#'     the yardstick package.}
#'   \item{estimate}{Character. The performance estimate, as returned by
#'     the yardstick package.}
#'   \item{estimator}{Character. The performance estimator, as returned by
#'     the yardstick package.}
#' }
# todo: link to more detailed analysis
#' @source <https://github.com/simonpcouch/metalearner>
#'
#' @examples
#' str(metalearners)
#'
#' metalearners
#'
"metalearners"
