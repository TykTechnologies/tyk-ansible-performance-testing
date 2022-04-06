#!/usr/bin/R

BASE_DIR <- "./benchmarks/"

# Define testing variables
# filter <- c("rest")
# x <- c("t2.medium", "c5.xlarge", "c5.2xlarge", "c5.4xlarge")
# weights <- c(2, 4, 8, 16)
# compare <- c("upstream", "tyk", "kong")
# tests <- c("rps", "p99")
# legends <- c("topleft", "topright")
# title <- paste(compare, collapse=' vs ')
# titles <- c(paste(title, "RPS"), paste(title, "P99"))

filter <- c("stitch")
x <- c("t2.medium", "c5.xlarge", "c5.2xlarge", "c5.4xlarge")
weights <- c(2, 4, 8, 16)
compare <- c("tyk-stitch-0", "apollo-stitch-0", "tyk-stitch-1", "apollo-stitch-1", "tyk-stitch-2", "apollo-stitch-2")
tests <- c("rps", "p99")
legends <- c("topleft", "topright")
title <- "Tyk vs Apollo Stitch"
titles <- c(paste(title, "RPS"), paste(title, "P99"))

files <- list.files(BASE_DIR)
files <- files[grep(filter, files)]

all_data <- data.frame(matrix(0, nrow=length(files), ncol=2))
rownames(all_data) <- files
colnames(all_data) <- c("rps", "p99")

for (file in files) {
  coxn <- file(paste(BASE_DIR, file, sep=""), open="r")
  path_data <- as.list(readLines(coxn))
  rps <- strsplit(path_data[grep("Requests/sec:", path_data)][[1]], '\t')[[1]][2]
  p99 <- strsplit(path_data[grep("99%", path_data)][[1]], ' +')[[1]][4]
  all_data[file, 1] <- rps
  all_data[file, 2] <- p99
}

# Parse all rps and p99 as numeric.
all_data$rps <- as.numeric(all_data$rps)
all_data$p99 <- as.numeric(all_data$p99)

shapes <- 15:(15 + length(compare))
color <- c("#505071", "#00CDB0", "#FF7787")

data <- list()
for (i in 1:length(x)) {
  data[[i]] <- all_data[grep(x[i], files),]
}

for (i in 1:length(tests)) {
  png(paste("./analysis/", filter, "-", paste(compare, collapse="-"), "-", tests[i], ".png", sep=""), width=8, height=8, units="in", res=200)
  plot(weights, c(1:length(data)), col="white", ylim=c(0, max(all_data[, tests[i]])), main=titles[i], ylab=tests[i], xaxt="n", xlab="Machine type")
  axis(1, at=weights, labels=x)

  for (j in 1:length(compare)) {
    service <- list()
    for (k in 1:length(data)) {
      # Iterate access the x variable and taking the mean of the replicas based on the result of the grep of compare
      service <- c(service, mean(data[[k]][, tests[i]][grep(compare[j], rownames(data[[k]]))]))
    }
    print(service)
    points(weights, service, pch=shapes[j], col=color[j], cex=2)
    lines(weights, service, col=color[j])
  }
  legend(legend=compare, pch=shapes, x=legends[i], col=color, cex=2)
  dev.off()
}
