% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pr.R
\name{pr_handle}
\alias{pr_handle}
\alias{pr_get}
\alias{pr_post}
\alias{pr_put}
\alias{pr_delete}
\alias{pr_head}
\title{Add handler to Plumber router}
\usage{
pr_handle(pr, methods, path, handler, preempt, serializer, endpoint, ...)

pr_get(pr, path, handler, preempt, serializer, endpoint, ...)

pr_post(pr, path, handler, preempt, serializer, endpoint, ...)

pr_put(pr, path, handler, preempt, serializer, endpoint, ...)

pr_delete(pr, path, handler, preempt, serializer, endpoint, ...)

pr_head(pr, path, handler, preempt, serializer, endpoint, ...)
}
\arguments{
\item{pr}{A Plumber API. Note: The supplied Plumber API object will also be updated in place as well as returned by the function.}

\item{methods}{Character vector of HTTP methods}

\item{path}{The endpoint path}

\item{handler}{A handler function}

\item{preempt}{A preempt function}

\item{serializer}{A Plumber serializer}

\item{endpoint}{A \code{PlumberEndpoint} object}

\item{...}{Additional arguments for \code{PlumberEndpoint}}
}
\value{
A Plumber router with the handler added
}
\description{
This collection of functions creates handlers for a Plumber router.
}
\details{
The generic \code{\link[=pr_handle]{pr_handle()}} creates a handle for the given method(s). Specific
functions are implemented for the following HTTP methods:
\itemize{
\item \code{GET}
\item \code{POST}
\item \code{PUT}
\item \code{DELETE}
\item \code{HEAD}
Each function mutates the Plumber router in place, but also invisibly returns
the updated router.
}
}
\examples{
\dontrun{
pr() \%>\%
  pr_handle("GET", "/hi", function() "Hello World") \%>\%
  pr_run()

pr() \%>\%
  pr_handle(c("GET", "POST"), "/hi", function() "Hello World") \%>\%
  pr_run()

pr() \%>\%
  pr_get("/hi", function() "Hello World") \%>\%
  pr_post("/echo", function(req, res) {
    if (req$postBody == "") return("No input")
    input <- jsonlite::fromJSON(req$postBody)
    list(
      input = input
    )
  }) \%>\%
  pr_run()
}

}
