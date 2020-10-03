// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// IntervalContains
std::vector<bool> IntervalContains(NumericVector x, long double inf, long double sup, long double min, long double max, bool bound, const char* class_str);
RcppExport SEXP _set6_IntervalContains(SEXP xSEXP, SEXP infSEXP, SEXP supSEXP, SEXP minSEXP, SEXP maxSEXP, SEXP boundSEXP, SEXP class_strSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< long double >::type inf(infSEXP);
    Rcpp::traits::input_parameter< long double >::type sup(supSEXP);
    Rcpp::traits::input_parameter< long double >::type min(minSEXP);
    Rcpp::traits::input_parameter< long double >::type max(maxSEXP);
    Rcpp::traits::input_parameter< bool >::type bound(boundSEXP);
    Rcpp::traits::input_parameter< const char* >::type class_str(class_strSEXP);
    rcpp_result_gen = Rcpp::wrap(IntervalContains(x, inf, sup, min, max, bound, class_str));
    return rcpp_result_gen;
END_RCPP
}
// IntervalContainsAll
bool IntervalContainsAll(NumericVector x, long double inf, long double sup, long double min, long double max, bool bound, const char* class_str);
RcppExport SEXP _set6_IntervalContainsAll(SEXP xSEXP, SEXP infSEXP, SEXP supSEXP, SEXP minSEXP, SEXP maxSEXP, SEXP boundSEXP, SEXP class_strSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< long double >::type inf(infSEXP);
    Rcpp::traits::input_parameter< long double >::type sup(supSEXP);
    Rcpp::traits::input_parameter< long double >::type min(minSEXP);
    Rcpp::traits::input_parameter< long double >::type max(maxSEXP);
    Rcpp::traits::input_parameter< bool >::type bound(boundSEXP);
    Rcpp::traits::input_parameter< const char* >::type class_str(class_strSEXP);
    rcpp_result_gen = Rcpp::wrap(IntervalContainsAll(x, inf, sup, min, max, bound, class_str));
    return rcpp_result_gen;
END_RCPP
}
// PrimesContains
LogicalVector PrimesContains(IntegerVector x);
RcppExport SEXP _set6_PrimesContains(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(PrimesContains(x));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_set6_IntervalContains", (DL_FUNC) &_set6_IntervalContains, 7},
    {"_set6_IntervalContainsAll", (DL_FUNC) &_set6_IntervalContainsAll, 7},
    {"_set6_PrimesContains", (DL_FUNC) &_set6_PrimesContains, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_set6(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
