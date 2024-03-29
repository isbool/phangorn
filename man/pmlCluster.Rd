% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pmlPart.R
\name{pmlCluster}
\alias{pmlCluster}
\title{Stochastic Partitioning}
\usage{
pmlCluster(formula, fit, weight, p = 1:5, part = NULL, nrep = 10,
  control = pml.control(epsilon = 1e-08, maxit = 10, trace = 1), ...)
}
\arguments{
\item{formula}{a formula object (see details).}

\item{fit}{an object of class \code{pml}.}

\item{weight}{\code{weight} is matrix of frequency of site patterns for all
genes.}

\item{p}{number of clusters.}

\item{part}{starting partition, otherwise a random partition is generated.}

\item{nrep}{number of replicates for each p.}

\item{control}{A list of parameters for controlling the fitting process.}

\item{\dots}{Further arguments passed to or from other methods.}
}
\value{
\code{pmlCluster} returns a list with elements
\item{logLik}{log-likelihood of the fit} \item{trees}{a list of all trees
during the optimization.} \item{fits}{fits for the final partitions}
}
\description{
Stochastic Partitioning of genes into p cluster.
}
\details{
The \code{formula} object allows to specify which parameter get optimized.
The formula is generally of the form \code{edge + bf + Q ~ rate + shape +
\dots{}}, on the left side are the parameters which get optimized over all
cluster, on the right the parameter which are optimized specific to each
cluster. The parameters available are \code{"nni", "bf", "Q", "inv",
"shape", "edge", "rate"}.  Each parameter can be used only once in the
formula.  There are also some restriction on the combinations how parameters
can get used. \code{"rate"} is only available for the right side.  When
\code{"rate"} is specified on the left hand side \code{"edge"} has to be
specified (on either side), if \code{"rate"} is specified on the right hand
side it follows directly that \code{edge} is too.
}
\examples{

\dontrun{
data(yeast)
dm <- dist.logDet(yeast)
tree <- NJ(dm)
fit <- pml(tree,yeast)
fit <- optim.pml(fit)

weight <- xtabs(~ index+genes,attr(yeast, "index"))
set.seed(1)

sp <- pmlCluster(edge~rate, fit, weight, p=1:4)
sp
SH.test(sp)
}

}
\references{
K. P. Schliep (2009). Some Applications of statistical
phylogenetics (PhD Thesis)

Lanfear, R., Calcott, B., Ho, S.Y.W. and Guindon, S. (2012) PartitionFinder:
Combined Selection of Partitioning Schemes and Substitution Models for
Phylogenetic Analyses. \emph{Molecular Biology and Evolution}, \bold{29(6)},
1695-1701
}
\seealso{
\code{\link{pml}},\code{\link{pmlPart}},\code{\link{pmlMix}},
\code{\link{SH.test}}
}
\author{
Klaus Schliep \email{klaus.schliep@gmail.com}
}
\keyword{cluster}
