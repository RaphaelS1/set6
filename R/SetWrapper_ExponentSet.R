#' @name ExponentSet
#' @template SetWrapper
#' @templateVar operation exponentiation
#' @templateVar class ExponentSet
#' @export
ExponentSet <- R6Class("ExponentSet",
  inherit = ProductSet,
  public = list(
    #' @description Create a new `ExponentSet` object. It is not recommended to construct this
    #' class directly.
    #' @param set [Set] to wrap.
    #' @param power numeric. Power to raise Set to.
    #' @return A new `ExponentSet` object.
    initialize = function(set, power) {

      if (power == "n") {
        lower <- set$lower
        upper <- set$upper
        setlist <- list(set)
        private$.power <- "n"
        cardinality <- NULL
      } else {
        lower <- Tuple$new(rep(set$lower, power))
        upper <- Tuple$new(rep(set$upper, power))
        setlist <- rep(list(set), power)
        private$.power <- as.integer(power)

        if (is.null(set$properties$cardinality)) {
          cardinality <- NULL
        } else if (grepl("Beth|Aleph", set$properties$cardinality)) {
          cardinality <- set$properties$cardinality
        } else {
          cardinality <- set$properties$cardinality^power
        }
      }

      type <- "{}"

      super$initialize(setlist = setlist, lower = lower, upper = upper, type = type,
                       cardinality = cardinality)
    },

    #' @template param_strprint
    #' @description Creates a printable representation of the object.
    #' @return A character string representing the object.
    strprint = function(n = 2) {
      if (inherits(self$wrappedSets[[1]], "SetWrapper")) {
        paste0("(", self$wrappedSets[[1]]$strprint(n = n), ")^", self$power)
      } else {
        paste(self$wrappedSets[[1]]$strprint(n = n), self$power, sep = "^")
      }
    },

    #' @description Tests if elements `x` are contained in `self`.
    #' @template param_xall
    #' @param bound logical
    #' @return If `all == TRUE` then returns `TRUE` if all `x` are contained in `self`,
    #' otherwise `FALSE`. If `all == FALSE` returns a vector of logicals corresponding to the
    #' length of `x`, representing if each is contained in `self`. If `bound == TRUE` then an
    #' element is contained in `self` if it is on or within the (possibly-open) bounds of `self`,
    #' otherwise `TRUE` only if the element is within `self` or the bounds are closed.
    contains = function(x, all = FALSE, bound = FALSE) {

      x <- listify(x)

      if (self$power == "n") {
        ret <- self$wrappedSets[[1]]$contains(
          unlist(lapply(x, function(.x) if (testSet(.x)) .x$elements else .x)),
          all, bound
        )
      } else {
        ret <- sapply(x, function(el) {
          if (!testSet(el)) {
            el <- as.Set(el)
          }

          if (el$length != self$power) {
            return(FALSE)
          }

          all(self$wrappedSets[[1]]$contains(el$elements, bound = bound))
        })
      }

      returner(ret, all)
    }
  ),

  active = list(
    #' @field power
    #' Returns the power that the wrapped set is raised to.
    power = function() {
      return(private$.power)
    }
  ),

  private = list(
    .power = 1L
  )
)
