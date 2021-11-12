#' Fit reporting delay and get parameters
#'
#' @param dat dataframe that contains
#' @param digit divisor number to be used
#' @export
get_reporting_delay_pars <- \(dat, init_pars, dist) {
  rd <- dat$rd
  lik <- \(pars) { return(-sum(log((eval(parse(text=paste0("p", dist, "(rd+0.5, shape=pars[1], scale=pars[2]) - p", dist, "(rd-0.5, shape=pars[1], scale=pars[2])"))))))) }
  options(warn=-1)
  opt_rd <- optim(init_pars, fn=lik, method='BFGS', control = list(maxit=100000, trace=0))
  options(warn=0)
  opt_rd$par
}
