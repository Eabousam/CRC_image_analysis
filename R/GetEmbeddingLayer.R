#' Extract layer-0 embedding from Prov-GigaPath CSV
#'
#' @param pg_csv Path to a Prov-GigaPath CSV file
#' @param layer The embedding layer to extract (default 0)
#' @return Numeric vector of embeddings
#' @export
#' 
getEmbeddingLayer <- function(pg_csv, layer = 0) {
  
  # Load CSV
  x <- readr::read_csv(pg_csv, show_col_types = FALSE)
  
  if (nrow(x) == 0) return(rep(NA, 768))
  
  # Get column for the requested layer
  layer_col <- layer + 1  # column index
  tensor_string <- x[[1, layer_col]]
  
  # Clean tensor string and convert to numeric
  clean_string <- gsub("tensor\\(\\[\\[|\\]\\]\\)", "", tensor_string)
  as.numeric(unlist(strsplit(clean_string, ",\\s*")))
}