#ifndef PHANGORNUTILS_H
#define PHANGORNUTILS_H

#include <Rcpp.h>
using namespace Rcpp;

List allDescCPP(IntegerMatrix orig, int nTips);

List bipartCPP(IntegerMatrix orig, int nTips);

std::vector< std::vector<int> > bipCPP(IntegerMatrix orig, int nTips);

List allChildrenCPP(const IntegerMatrix orig);

List allSiblingsCPP(const IntegerMatrix & edge);

NumericVector p2dna(NumericMatrix xx, double eps=0.999);

NumericVector node_height_cpp(NumericVector edge1, NumericVector edge2,
                              NumericVector edge_length);

NumericVector cophenetic_cpp(IntegerMatrix edge, NumericVector edge_length,
                             int nTips, int nNode);

NumericVector threshStateC(NumericVector x, NumericVector thresholds);

int countCycle_cpp(IntegerMatrix M);

std::vector<int> getIndex(NumericVector left, NumericVector right, int n);

#endif
