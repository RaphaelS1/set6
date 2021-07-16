# set6 0.2.2.9000

* Containedness checks for 'n' dimensional sets no longer require same length vectors if power is
"n"

# set6 0.2.2
* Fixed bug preventing `Logicals` from being deep cloned

# set6 0.2.1

* Bugfix in setcomplement (#65)
* Impossible intervals containing only one elements with type not equal to `[]` are now equal to the empty set
* Default `ConditionalSet` `condition` argument now `function(x) TRUE`
* Print method for `ConditionalSet` now omits RHS if only `"TRUE"`

# set6 0.2.0

* UniversalSet renamed Universal, old class will be removed in v0.4.0.
* LogicalSet renamed Logicals, old class will be removed in v0.4.0.
* `Complex` now inherits from `Set`, incorrect methods for `isSubset, equals` have been removed.
* Add `Multiset` for sets with non-unique elements but no ordering
* Small speed improvements in `Tuple` and `FuzzyTuple`
* For consistency most methods now return a `list` unless single elements requested
* Printing of `ConditionalSet` is fixed
* `Rationals` and child-classes now error on calls to `contains, isSubset, equals` as any prior results were likely wrong/misleading
* Removed erroneous complex boundaries in `Interval` class

# set6 0.1.8

* Patch for R-devel

# set6 0.1.7

* Critical patch

# set6 0.1.6

* Bugfix in set operation cleaner
* Bugfix causing `Interval$contains` to return `TRUE` for tuples
* Bugfix in union sets incorrectly unwrapping products
* Added variable length `ExponentSet`s

# set6 0.1.5

* Added `LogicalSet`, the set of $\{TRUE, FALSE\}$
* Added `as.Set.numeric` and `as.Tuple.numeric`

# set6 0.1.4

* Speed performance improvements for `$contains` method for `Interval` and `Set`. `Rcpp` now used for `Interval`.
* Now for any `Interval` if not bounded above and `upper` is $Inf$ then `max = .Machine$double.xmax`, analogously for `lower`.
* Default universe of `Interval` is now `ExtendedReals`
* Added default `as.Set` and `as.Interval` S3 methods

# set6 0.1.3

* Added assertion for testing if a set is countably finite
* Slight speed improvements to operations - still require a lot of work
* Fixed bug in `UnionSet` cardinality calculation
* Fixed bug in `UniversalSet` countability

# set6 0.1.2

### Patches
- Updated documentation to be compatible with roxygen2
- Fixed bug in typed Complex sets
- Added universe assertion check to `Set` constructor
- Bug fix in `setunion` causing some intervals not to be combined correctly
- `Interval$isSubset` now compares sets using `max` and `min` instead of `upper` and `lower`
- Calculation of `min` and `max` in `Interval` now uses `1e-15` instead of `.Machine$double.xmin`
- `$elements` now always returns a `list`

### Added classes, methods, and functions
- Add `$add` public method to sets, which mutates sets by adding given elements, and coercing to the typed-set class if appropriate
- Add `$remove` public method to sets, which mutates sets by removing given elements.
- Add assertion for checking if elements contained in a set, `test/check/assertContains`.
- Add assertion for checking if sets are subsets of another, `test/check/assertSubset`.

# set6 0.1.1

### Patches
- `absComplement` method is now deprecated, instead use `setcomplement` and omit the `y` argument
- Fixed error in `contains` default caused by `%inset%`
- Improved printing of `SpecialSet`s when `zero == TRUE`
- Added `UniversalSet` for the set containing all elements
- Changed default `universe` of sets to `UniversalSet`
- Coercions now error instead of producing a message when they fail
- On construction, `Set`s no longer guess the set class, instead an extra `class` argument is added to give a set the `typed` property
- The internal `Set` structure is slightly changed so that set elements are now stored in lists by default, which is only changed if the set is `typed`
- Added `element` argument to `Set` constructor, which takes a `list`. This is more efficient if passing lists of lists or lists of multiple types, and in line with the `FuzzySet` constructor
- Improved printing of `ConditionalSet`s
- Updated `powerset` to always return a `Set` of `Set`s (even if input is `Tuple`)
- Fixed bug in `Properties` causing an error if cardinality was too large
- Updated documentation
- Reduced `Set` constructor bottleneck by adding 'typed' sets
- Changed `use_unicode` default to `l10n_info()$UTF-8`

# set6 0.1.0

- `set6` upgrades the `sets` package to R6. Many forms of mathematical sets are implemented, including (countably finite) sets, tuples, intervals (countably infinite or uncountable), and fuzzy variants. Wrappers extend functionality by allowing symbolic representations of complex operations on sets, including unions, (cartesian) products, exponentiation, and differences (asymmetric and symmetric).
- See [the website](https://xoopR.github.io/set6/) for more details and the project readme
- See [getting started vignette](https://xoopR.github.io/set6/articles/set6.html) for a short tutorial and introduction
- `set6` is currently 'maturing', so whilst no major updates are planned they may happen. Constant minor updates should be expected.