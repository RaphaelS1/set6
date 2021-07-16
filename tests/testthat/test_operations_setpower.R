test_that("Set", {
  expect_equal(setpower(Set$new(1, 2), 2, simplify = FALSE)$strprint(), "{1, 2}^2")
  expect_true(setpower(Set$new(1, 2), 2, simplify = TRUE)$equals(Set$new(Tuple$new(1, 1), Tuple$new(2, 1), Tuple$new(1, 2), Tuple$new(2, 2))))
  expect_equal(Set$new(1, 2)^1, Set$new(1, 2))
  expect_equal(Set$new(1, 2)^0, Set$new())
})

test_that("conditionalset", {
  useUnicode(FALSE)
  expect_equal((ConditionalSet$new(function(x) x == 1)^2)$strprint(), "{x in V : x == 1}^2")
  useUnicode(TRUE)
})

test_that("interval", {
  i <- Interval$new(1, 2)^3
  expect_equal(i$strprint(), "[1,2]^3")
  expect_equal(i$power, 3)
})

test_that("exponent", {
  expect_equal((Interval$new(1, 2)^2)^3, Interval$new(1, 2)^6)
})

test_that("setwrapper", {
  useUnicode(FALSE)
  expect_equal(
    ((Interval$new(1, 2) + Interval$new(3, 4))^2)$strprint(),
    "([1,2] U [3,4])^2"
  )
  useUnicode(TRUE)
})

test_that("variable", {
  x <- Interval$new(0, 1)^"n"
  expect_true(x$contains(Tuple$new(0)))
  expect_true(x$contains(Tuple$new(0, 1)))
  expect_true(x$contains(Tuple$new(0, 1, 0, 0, 1, 1, 0)))
  expect_false(x$contains(Tuple$new(0, 2)))
  expect_error(x$contains(1))

  expect_equal(x$contains(list(Tuple$new(1), Tuple$new(2))), c(TRUE, FALSE))
  expect_equal(x$contains(list(Tuple$new(1, 0), Tuple$new(1, 1))), c(TRUE, TRUE))

  expect_equal(x * Reals$new(), x)
  expect_equal((Reals$new()^"n") * (Reals$new()^2), Reals$new()^"n")
  expect_equal(x^2, x)
})

test_that("can test contain any length", {
  tuples <- list(
    Tuple$new(1),
    Tuple$new(1, 2),
    Tuple$new(1, 2, 3)
  )
  set <- Reals$new()^"n"
  expect_true(set$contains(tuples, all = TRUE))
})