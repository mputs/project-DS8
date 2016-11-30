source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")

# library(h5)
library(rhdf5)


f <- "OCO2/qqq.h5"

x <- h5dump(f)

df <- do.call(data.frame, do.call(c, lapply(x, function(a) {
  sel <- sapply(a, function(b) !is.null(b) && dim(b)[1]==17124L)
  if (any(sel)) lapply(a[sel], as.vector) else NULL
})))

df2 <- df[, c("RetrievalGeometry.retrieval_latitude", "RetrievalGeometry.retrieval_longitude","RetrievalResults.xco2")]

names(df)[grep("lat", names(df), fixed = TRUE)]

library(sp)
library(tmap)

coordinates(df2) <- ~RetrievalGeometry.retrieval_longitude + RetrievalGeometry.retrieval_latitude

tmap_mode("view")
qtm(df2)