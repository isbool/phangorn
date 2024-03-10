#ifndef PHANGORNUTILS_H
#define PHANGORNUTILS_H

#include <Rcpp.h>
using namespace Rcpp;

List allDescCPP(IntegerMatrix orig, int nTips);

List bipartCPP(IntegerMatrix orig, int nTips);

std::vector< std::vector<int> > bipCPP(IntegerMatrix orig, int nTips);

List allChildrenCPP(const IntegerMatrix orig);

List allSiblingsCPP(const IntegerMatrix & edge);

IntegerVector p2dna(NumericMatrix xx, double eps=0.999);

IntegerVector node_height_cpp(IntegerVector edge1, IntegerVector edge2,
                              IntegerVector edge_length);

IntegerVector cophenetic_cpp(IntegerMatrix edge, IntegerVector edge_length,
                             int nTips, int nNode);

IntegerVector threshStateC(IntegerVector x, IntegerVector thresholds);

int countCycle_cpp(IntegerMatrix M);

std::vector<int> getIndex(IntegerVector left, IntegerVector right, int n);

#endif
