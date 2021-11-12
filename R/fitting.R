#' Fit reporting delay and get parameters
#'
#' This function takes an empirical reporting delay (date of report - date of
#' onset) and fits it to the specified distribution
#' @param dat dataframe that contains a variable called rd, which is the
#' empirical reporting delay
#' @param init_pars divisor number to be used (max length = 2)
#' @param dist character string of distribution type to be used
#' @export
get_reporting_delay <- \(dat, init_pars, dist) {
  rd <- dat$rd
  llk <- \(pars) { return(-sum(log((eval(parse(text=paste0("p", dist, "(rd+0.5, shape=pars[1], scale=pars[2]) - p", dist, "(rd-0.5, shape=pars[1], scale=pars[2])"))))))) }
  options(warn=-1)
  opt_rd <- optim(init_pars, fn=llk, method='BFGS', control = list(maxit=100000, trace=0))
  options(warn=0)
  opt_rd$par
}
