#' Round down using a given digit type
#'
#' @param x input data
#' @param digit divisor number to be used
#' @export
getmin <- \(x,digit) { plyr::round_any(min(x), digit, f=floor) }

#' Round up using a given digit type
#'
#' @param x input data
#' @param digit divisor number to be used
#' @export
getmax <- \(x,digit) { plyr::round_any(max(x), digit, f=ceiling) }
