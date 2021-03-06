#' @name FuzzyMultiset
#' @title Mathematical Fuzzy Multiset
#' @description A general FuzzyMultiset object for mathematical fuzzy multisets, inheriting from `FuzzySet`.
#' @family sets
#'
#' @details
#' Fuzzy multisets generalise standard mathematical multisets to allow for fuzzy relationships. Whereas a
#' standard, or crisp, multiset assumes that an element is either in a multiset or not, a fuzzy multiset allows
#' an element to be in a multiset to a particular degree, known as the membership function, which
#' quantifies the inclusion of an element by a number in \[0, 1\]. Thus a (crisp) multiset is a
#' fuzzy multiset where all elements have a membership equal to \eqn{1}. Similarly to [Multiset]s, elements
#' do not need to be unique.
#'
#' @examples
#' # Different constructors
#' FuzzyMultiset$new(1, 0.5, 2, 1, 3, 0)
#' FuzzyMultiset$new(elements = 1:3, membership = c(0.5, 1, 0))
#'
#' # Crisp sets are a special case FuzzyMultiset
#' # Note membership defaults to full membership
#' FuzzyMultiset$new(elements = 1:5) == Multiset$new(1:5)
#'
#' f <- FuzzyMultiset$new(1, 0.2, 2, 1, 3, 0)
#' f$membership()
#' f$alphaCut(0.3)
#' f$core()
#' f$inclusion(0)
#' f$membership(0)
#' f$membership(1)
#'
#' # Elements can be duplicated, and with different memberships,
#' #  although this is not necessarily sensible.
#' FuzzyMultiset$new(1, 0.1, 1, 1)
#'
#' # Like FuzzySets, ordering does not matter.
#' FuzzyMultiset$new(1, 0.1, 2, 0.2) == FuzzyMultiset$new(2, 0.2, 1, 0.1)
#' @export
FuzzyMultiset <- R6Class("FuzzyMultiset",
  inherit = FuzzySet,
  public = list(
    #' @description Tests if two sets are equal.
    #' @details Two fuzzy sets are equal if they contain the same elements with the same memberships and
    #' in the same order. Infix operators can be used for:
    #' \tabular{ll}{
    #' Equal \tab `==` \cr
    #' Not equal \tab `!=` \cr
    #' }
    #' @param x [Set] or vector of [Set]s.
    #' @param all logical. If `FALSE` tests each `x` separately. Otherwise returns `TRUE` only if all `x` pass test.
    #' @return If `all` is `TRUE` then returns `TRUE` if all `x` are equal to the Set, otherwise
    #' `FALSE`. If `all` is `FALSE` then returns a vector of logicals corresponding to each individual
    #' element of `x`.
    equals = function(x, all = FALSE) {
      if (all(self$membership() == 1)) {
        return(self$core(create = T)$equals(x))
      }

      x <- listify(x)

      ret <- sapply(x, function(el) {
        if (!testFuzzySet(el)) {
          return(FALSE)
        }

        if (el$length != self$length) {
          return(FALSE)
        }

        ifelse(all(all.equal(el$multiplicity(), self$multiplicity()) == TRUE), TRUE, FALSE) &&
          ifelse(all(all.equal(el$membership(), self$membership()) == TRUE), TRUE, FALSE)
      })

      returner(ret, all)
    },

    #' @description  Test if one set is a (proper) subset of another
    #' @param x any. Object or vector of objects to test.
    #' @param proper logical. If `TRUE` tests for proper subsets.
    #' @param all logical. If `FALSE` tests each `x` separately. Otherwise returns `TRUE` only if all `x` pass test.
    #' @details If using the method directly, and not via one of the operators then the additional boolean
    #' argument `proper` can be used to specify testing of subsets or proper subsets. A Set is a proper
    #' subset of another if it is fully contained by the other Set (i.e. not equal to) whereas a Set is a
    #' (non-proper) subset if it is fully contained by, or equal to, the other Set.
    #'
    #' Infix operators can be used for:
    #' \tabular{ll}{
    #' Subset \tab `<` \cr
    #' Proper Subset \tab `<=` \cr
    #' Superset \tab `>` \cr
    #' Proper Superset \tab `>=`
    #' }
    #'
    #' @return If `all` is `TRUE` then returns `TRUE` if all `x` are subsets of the Set, otherwise
    #' `FALSE`. If `all` is `FALSE` then returns a vector of logicals corresponding to each individual
    #' element of `x`.
    isSubset = function(x, proper = FALSE, all = FALSE) {
      if (all(self$membership() == 1)) {
        return(self$core(create = T)$isSubset(x, proper = proper, all = all))
      }

      x <- listify(x)

      ret <- rep(FALSE, length(x))
      ind <- sapply(x, testFuzzyMultiset)

      ret[ind] <- sapply(x[ind], function(el) {
        self_comp <- paste(self$elements, self$membership(), sep = ";")
        el_comp <- paste(el$elements, el$membership(), sep = ";")

        if (el$length > self$length) {
          return(FALSE)
        } else if (el$length == self$length) {
          if (!proper & el$equals(self)) {
            return(TRUE)
          } else {
            return(FALSE)
          }
        } else {
          mtc <- match(el_comp, self_comp)
          if (all(is.na(mtc))) {
            return(FALSE)
          } else {
            return(TRUE)
          }
        }
      })

      returner(ret, all)
    },

    #' @description The alpha-cut of a fuzzy set is defined as the set
    #' \deqn{A_\alpha = \{x \epsilon F | m \ge \alpha\}}{A_\alpha = {x \epsilon F | m \ge \alpha}}
    #' where \eqn{x} is an element in the fuzzy set, \eqn{F}, and \eqn{m} is the corresponding membership.
    #' @param alpha numeric in \[0, 1\] to determine which elements to return
    #' @param strong logical, if `FALSE` (default) then includes elements greater than or equal to alpha, otherwise only strictly greater than
    #' @param create logical, if `FALSE` (default) returns the elements in the alpha cut, otherwise returns a crisp set of the elements
    #' @return Elements in [FuzzyMultiset] or a [Set] of the elements.
    alphaCut = function(alpha, strong = FALSE, create = FALSE) {
      els <- self$elements
      mem <- self$membership()

      if (strong) {
        mtc <- match(names(mem[mem > alpha]), private$.str_elements)
      } else {
        mtc <- match(names(mem[mem >= alpha]), private$.str_elements)
      }

      els <- els[mtc][!is.na(mtc)]

      if (create) {
        if (length(els) == 0) {
          return(Set$new())
        } else {
          return(Multiset$new(elements = els))
        }
      } else {
        if (length(els) == 0) {
          return(NULL)
        } else {
          return(els)
        }
      }
    }
  ),

  private = list(
    .type = "()"
  )
)
