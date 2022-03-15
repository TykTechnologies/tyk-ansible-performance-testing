#!/usr/bin/R

BASE_DIR <- "./benchmarks/"

files <- list.files(BASE_DIR)

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

# Define testing variables
clouds <- c("aws", "gcp")
machines <- cbind(
  c("t3.medium", "m5.large", "c5.xlarge"),
  c("n1-standard-1", "n1-standard-4", "n1-highcpu-16")
)
services <- c("upstream", "tyk", "kong")
types <- c("rps", "p99")
title <- paste(services, collapse=' vs ')
titles <- c(paste(title, "RPS"), paste(title, "P99"))

shapes <- c(15, 16, 17)
color <- c("#505071", "#00CDB0", "#FF7787")

for (i in 1:length(clouds)) {
  data_1 <- all_data[grep(machines[1, i], files),]
  data_2 <- all_data[grep(machines[2, i], files),]
  data_3 <- all_data[grep(machines[3, i], files),]

  for (j in 1:length(types)) {
    png(paste("./analysis/", clouds[i], "-", types[j], ".png", sep=""))
    plot(c(1, 2, 3), c(1, 2, 3), col="white", ylim=c(0, max(all_data[, types[j]])), main=titles[j], ylab=types[j], xaxt="n", xlab="Machine type")
    axis(1, at=c(1, 2, 3), labels=machines[, i])

    for (k in 1:length(services)) {
      service <- c(
        mean(data_1[, types[j]][grep(services[k], rownames(data_1))]),
        mean(data_2[, types[j]][grep(services[k], rownames(data_2))]),
        mean(data_3[, types[j]][grep(services[k], rownames(data_3))])
      )
      points(c(1, 2, 3), service, pch=shapes[k], col=color[k])
      lines(c(1, 2, 3), service, col=color[k])
    }
    legend(legend=services, pch=shapes, x="topleft", col=color)
    dev.off()
  }
}

