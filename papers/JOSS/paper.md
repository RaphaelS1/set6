---
title: 'set6: R6 Mathematical Sets Interface'
tags:
  - R
  - statistics
  - sets
  - object-oriented
authors:
  - name: Raphael E.B. Sonabend
    orcid: 0000-0001-9225-4654
    affiliation: 1
  - name: Franz J. Kiraly
    affiliation: "1, 2"
affiliations:
 - name: Department of Statistical Science, University College London, Gower Street, London WC1E 6BT, United Kingdom
   index: 1
 - name: Shell
   index: 2
date: 17 February 2020
bibliography: paper.bib
---

# Summary

set6 makes use of the R6 object-oriented paradigm to introduce classes for important mathematical containers, including sets, tuples, and intervals (finite and infinite). Until now, the `R` [@packageR] programming language has traditionally supported mathematical sets in one of two ways: 1. via the five set operation functions: `union`, `intersect`, `setdiff`, `setequal`, `is.element`; and 2. via the `sets` [@packagesets] package. `set6` uses `R6` [@packageR6] and has a clear class interface with minimal dependencies, which makes it the perfect dependency for any package that requires containers for R6 objects. Making use of design patterns [@Gamma1996], such as wrappers and compositors, `set6` allows for symbolic representation of sets to ensure maximum efficiency, and to provide neat and clear print methods.

`set6` is currently being used in `distr6` [@packagedistr6], which is an object-oriented probability distributions interface, that makes use of `set6` for distribution and parameter support. Additional uses of `set6` include representing infinite sets, and constructing assertions.

The speed and efficiency of ``R6`` allows `set6` to be a scalable and efficient interface. A focus on symbolic representation and neat printing methods means that `set6` can accurately and clearly represent complicated sets. `set6` has the ambitious long-term goal of being the only dependency package needed for object-oriented interfaces in `R` that require clear symbolic representations of mathematical sets.

Related software includes the `sets` [@packagesets] family of packages.

# Key Design Principles

1. **Maximum user-control over set operations** - Users can select how operations act on sets, including a choice of  associativity, lazy evaluation, and unicode printing.
2. **Minimal dependencies** - `set6` has the goal of being a key dependency to any object-oriented requiring representation of mathematical sets, for example for representing function inputs and supports. Therefore `set6` is itself dependent on only three packages.
3. **Transparency in sets** - `set6` priorities symbolic representation and lazy evaluation to allow for the package to be scalable and to fit into any other package. However it is ensured that this does not detract from transparency, i.e. that an object that prints well is still clear in what it actually contains.  `set6` allows sets to be queried in many different ways, including calling the elements in the set (if finite), finding the bounds of the set (if numeric), and listing properties and traits.

# Key Use-Cases

1. **Constructing and querying mathematical sets** - Many mathematical Set-like objects can be constructed, including sets, tuple, intervals, and fuzzy variants. Sets and tuples can contain objects of any `R` type (atomic or otherwise). 
2. **Containedness checks** - Public methods allow all objects inheriting from `Set` to check if elements are contained within them. This provides a powerful mechanism for use with parameter or distribution supports for other packages.
3. **Representation of infinite sets** - Symbolic representation and lazy evaluation allows infinite (or very large) sets and intervals to be constructed. This also allows operations such as powerset to be used without crashing the system.
4. **Comparison of, possibly infinite, sets** - Two `Set` objects can be compared to check if they are equal or (proper) sub/supersets. Infix operators allow quick and neat comparison.
5. **Creation of multi-dimensional sets from simpler classes** - Common set operations, such as unions and complements are implemented, as well as products and exponents. Using these, sets of any complexity can be constructed.

# Software Availability

``set6`` is available on [GitHub](https://github.com/RaphaelS1/set6) and [CRAN](https://CRAN.R-project.org/package=set6). It can either be installed from GitHub using the `devtools` [@packagedevtools] library or directly from CRAN with `install.packages`. The package uses the MIT open-source licence. Contributions, issues, feature requests, and general feedback can all be found and provided on the project [GitHub](https://github.com/RaphaelS1/set6). Full tutorials and further details are available on the [project website](https://raphaels1.github.io/set6/).

# References