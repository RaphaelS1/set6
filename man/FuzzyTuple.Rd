% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Set_FuzzySet_FuzzyTuple.R
\name{FuzzyTuple}
\alias{FuzzyTuple}
\title{Mathematical Fuzzy Tuple}
\description{
A general FuzzyTuple object for mathematical fuzzy tuples, inheriting from \code{FuzzySet}.
}
\details{
Fuzzy tuples generalise standard mathematical tuples to allow for fuzzy relationships. Whereas a
standard, or crisp, tuple assumes that an element is either in a tuple or not, a fuzzy tuple allows
an element to be in a tuple to a particular degree, known as the membership function, which
quantifies the inclusion of an element by a number in [0, 1]. Thus a (crisp) tuple is a
fuzzy tuple where all elements have a membership equal to \eqn{1}. Similarly to \link{Tuple}s, elements
do not need to be unique and the ordering does matter, \link{FuzzySet}s are special cases where the ordering
does not matter and elements must be unique.
}
\examples{
# Different constructors
FuzzyTuple$new(1, 0.5, 2, 1, 3, 0)
FuzzyTuple$new(elements = 1:3, membership = c(0.5, 1, 0))

# Crisp sets are a special case FuzzyTuple
# Note membership defaults to full membership
FuzzyTuple$new(elements = 1:5) == Tuple$new(1:5)

f <- FuzzyTuple$new(1, 0.2, 2, 1, 3, 0)
f$membership()
f$alphaCut(0.3)
f$core()
f$inclusion(0)
f$membership(0)
f$membership(1)

# Elements can be duplicated, and with different memberships,
#  although this is not necessarily sensible.
FuzzyTuple$new(1, 0.1, 1, 1)

# More important is ordering.
FuzzyTuple$new(1, 0.1, 2, 0.2) != FuzzyTuple$new(2, 0.2, 1, 0.1)
FuzzySet$new(1, 0.1, 2, 0.2) == FuzzySet$new(2, 0.2, 1, 0.1)
}
\seealso{
Other sets: 
\code{\link{ConditionalSet}},
\code{\link{FuzzyMultiset}},
\code{\link{FuzzySet}},
\code{\link{Interval}},
\code{\link{Multiset}},
\code{\link{Set}},
\code{\link{Tuple}}
}
\concept{sets}
\section{Super classes}{
\code{\link[set6:Set]{set6::Set}} -> \code{\link[set6:FuzzySet]{set6::FuzzySet}} -> \code{FuzzyTuple}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-equals}{\code{FuzzyTuple$equals()}}
\item \href{#method-isSubset}{\code{FuzzyTuple$isSubset()}}
\item \href{#method-alphaCut}{\code{FuzzyTuple$alphaCut()}}
\item \href{#method-clone}{\code{FuzzyTuple$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="add">}\href{../../set6/html/Set.html#method-add}{\code{set6::Set$add()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="contains">}\href{../../set6/html/Set.html#method-contains}{\code{set6::Set$contains()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="multiplicity">}\href{../../set6/html/Set.html#method-multiplicity}{\code{set6::Set$multiplicity()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="print">}\href{../../set6/html/Set.html#method-print}{\code{set6::Set$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="remove">}\href{../../set6/html/Set.html#method-remove}{\code{set6::Set$remove()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="Set" data-id="summary">}\href{../../set6/html/Set.html#method-summary}{\code{set6::Set$summary()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="core">}\href{../../set6/html/FuzzySet.html#method-core}{\code{set6::FuzzySet$core()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="inclusion">}\href{../../set6/html/FuzzySet.html#method-inclusion}{\code{set6::FuzzySet$inclusion()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="initialize">}\href{../../set6/html/FuzzySet.html#method-initialize}{\code{set6::FuzzySet$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="membership">}\href{../../set6/html/FuzzySet.html#method-membership}{\code{set6::FuzzySet$membership()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="strprint">}\href{../../set6/html/FuzzySet.html#method-strprint}{\code{set6::FuzzySet$strprint()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="set6" data-topic="FuzzySet" data-id="support">}\href{../../set6/html/FuzzySet.html#method-support}{\code{set6::FuzzySet$support()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-equals"></a>}}
\if{latex}{\out{\hypertarget{method-equals}{}}}
\subsection{Method \code{equals()}}{
Tests if two sets are equal.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FuzzyTuple$equals(x, all = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{\link{Set} or vector of \link{Set}s.}

\item{\code{all}}{logical. If \code{FALSE} tests each \code{x} separately. Otherwise returns \code{TRUE} only if all \code{x} pass test.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Two fuzzy sets are equal if they contain the same elements with the same memberships and
in the same order. Infix operators can be used for:
\tabular{ll}{
Equal \tab \code{==} \cr
Not equal \tab \code{!=} \cr
}
}

\subsection{Returns}{
If \code{all} is \code{TRUE} then returns \code{TRUE} if all \code{x} are equal to the Set, otherwise
\code{FALSE}. If \code{all} is \code{FALSE} then returns a vector of logicals corresponding to each individual
element of \code{x}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-isSubset"></a>}}
\if{latex}{\out{\hypertarget{method-isSubset}{}}}
\subsection{Method \code{isSubset()}}{
Test if one set is a (proper) subset of another
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FuzzyTuple$isSubset(x, proper = FALSE, all = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{any. Object or vector of objects to test.}

\item{\code{proper}}{logical. If \code{TRUE} tests for proper subsets.}

\item{\code{all}}{logical. If \code{FALSE} tests each \code{x} separately. Otherwise returns \code{TRUE} only if all \code{x} pass test.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
If using the method directly, and not via one of the operators then the additional boolean
argument \code{proper} can be used to specify testing of subsets or proper subsets. A Set is a proper
subset of another if it is fully contained by the other Set (i.e. not equal to) whereas a Set is a
(non-proper) subset if it is fully contained by, or equal to, the other Set.

Infix operators can be used for:
\tabular{ll}{
Subset \tab \code{<} \cr
Proper Subset \tab \code{<=} \cr
Superset \tab \code{>} \cr
Proper Superset \tab \code{>=}
}
}

\subsection{Returns}{
If \code{all} is \code{TRUE} then returns \code{TRUE} if all \code{x} are subsets of the Set, otherwise
\code{FALSE}. If \code{all} is \code{FALSE} then returns a vector of logicals corresponding to each individual
element of \code{x}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-alphaCut"></a>}}
\if{latex}{\out{\hypertarget{method-alphaCut}{}}}
\subsection{Method \code{alphaCut()}}{
The alpha-cut of a fuzzy set is defined as the set
\deqn{A_\alpha = \{x \epsilon F | m \ge \alpha\}}{A_\alpha = {x \epsilon F | m \ge \alpha}}
where \eqn{x} is an element in the fuzzy set, \eqn{F}, and \eqn{m} is the corresponding membership.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FuzzyTuple$alphaCut(alpha, strong = FALSE, create = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{alpha}}{numeric in [0, 1] to determine which elements to return}

\item{\code{strong}}{logical, if \code{FALSE} (default) then includes elements greater than or equal to alpha, otherwise only strictly greater than}

\item{\code{create}}{logical, if \code{FALSE} (default) returns the elements in the alpha cut, otherwise returns a crisp set of the elements}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Elements in \link{FuzzyTuple} or a \link{Set} of the elements.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FuzzyTuple$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
