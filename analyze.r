#!/usr/bin/R

BASE_DIR <- "./benchmarks/"

args = commandArgs(trailingOnly=TRUE)

# RScript ./analyze.r "tyk,kong" "rest,aws" "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" "2,4,8,16" "Machine type" "t2.medium,c5.xlarge,c5.2xlarge,c5.4xlarge" "Tyk vs Kong" "Tyk,Kong"
# RScript ./analyze.r "tyk,kong" "rest,gcp" "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" "2,4,8,16" "Machine type" "e2-medium,c2-standard-4,c2-standard-8,c2-standard-16" "Tyk vs Kong" "Tyk,Kong"
compare <- strsplit(args[1], ",")[[1]]
filter <- strsplit(args[2], ",")[[1]]
x <- strsplit(args[3], ",")[[1]]
x_weights <- as.numeric(strsplit(args[4], ",")[[1]])
x_title <- args[5]
x_labels <- strsplit(args[6], ",")[[1]]
title <- args[7]
legend <- strsplit(args[8], ",")[[1]]

# Create the tests array to help iterate
tests <- c("rps", "p99")
legends <- c("topleft", "topright")
y_labels <- c("RPS", "P99")

###############################################################################
# Preprocess data
###############################################################################

# Fetch all files and filter them based on the AND of the filter collection
files <- list.files(BASE_DIR)
for (i in 1:length(filter)) {
  files <- files[grep(filter[i], files)]
}

# Create all_data matrix to house all the filtered files and add the column and
# row names.
all_data <- data.frame(matrix(0, nrow=length(files), ncol=length(tests)))
rownames(all_data) <- files
colnames(all_data) <- tests

for (filename in files) {
  # Open file
  coxn <- file(paste(BASE_DIR, filename, sep=""), open="r")
  file_lines <- as.list(readLines(coxn))
  # Grep the values of rps and p99 and store them in all_data
  all_data[filename, 1] <- strsplit(file_lines[grep("Requests/sec:", file_lines)][[1]], '\t')[[1]][2]
  all_data[filename, 2] <- strsplit(file_lines[grep("99%", file_lines)][[1]], ' +')[[1]][4]
  close(coxn)
}

# Parse all rps and p99 as numeric data.
all_data$rps <- as.numeric(all_data$rps)
all_data$p99 <- as.numeric(all_data$p99)

# Create the shapes and colors of the lines and points we are going to plot.
shapes <- rep(c(15, 16, 17, 18, 20), ceiling(length(compare) / 5))
color <- rep(c("#00D9BA", "#FF6C7D", "#505071", "#D6B218", "#C3C3E5", "#FFBBC5"), ceiling(length(compare) / 6))

# Filter the data into buckets based on the x values.
data <- list()
for (i in 1:length(x)) {
  data[[i]] <- all_data[grep(x[i], files),]
}

###############################################################################
# Generate the graphs
###############################################################################

# Preprocessing step to determine the means of the data so that we can find the appropriate max for the ylim
y <- list()
for (i in 1:length(tests)) {
  y[[i]] <- list()
  for (j in 1:length(compare)) {
    service <- list()
    for (k in 1:length(data)) {
      # Iterate access the x variable and taking the mean of the replicas based on the result of the grep of compare
      service <- c(service, mean(data[[k]][, tests[i]][grep(compare[j], rownames(data[[k]]))]))
    }
    y[[i]] <- c(y[[i]], service)
  }
}

for (i in 1:length(tests)) {
  # Define image and plit properties
  png(paste("./analysis/", filter, "-", paste(compare, collapse="-"), "-", tests[i], "-",paste(filter, collapse="-"), ".png", sep=""), width=8, height=8, units="in", res=100)
  plot(x_weights, c(1:length(data)), col="white", ylim=c(0, max(unlist(y[[i]]))), main=paste(title, y_labels[i]), ylab=y_labels[i], xaxt="n", xlab=x_title)
  axis(1, at=x_weights, labels=x_labels)

  for (j in 1:length(compare)) {
    service <- list()
    for (k in 1:length(data)) {
      # Iterate access the x variable and taking the mean of the replicas based on the result of the grep of compare
      service <- c(service, mean(data[[k]][, tests[i]][grep(compare[j], rownames(data[[k]]))]))
    }

    # Plot points and lines
    points(x_weights, service, pch=shapes[j], col=color[j], cex=2)
    lines(x_weights, service, col=color[j])
  }
  # Add legend
  legend(legend=legend, pch=shapes, x=legends[i], col=color, cex=1.5)
  abline(h=0, lwd=0.2,col=c(rgb(0,0,0,0.25)))
  dev.off()
}

###############################################################################
# Generate the CSV files
###############################################################################
# Generate rps and p99 lists to hold the data
rps <- list()
p99 <- list()
for (i in 1:length(compare)) {
  rps[[i]] <- numeric()
  p99[[i]] <- numeric()
  for (j in 1:length(data)) {
    rps[[i]][j] <- mean(data[[j]][grep(compare[i], rownames(data[[j]])), ]$rps)
    p99[[i]][j] <- mean(data[[j]][grep(compare[i], rownames(data[[j]])), ]$p99)
  }
}

# Generate CSV function
generate_csv <- function(l, type) {
  # Turn data into tables and assigning the roles and column names.
  l <- as.data.frame(do.call(rbind, l))
  colnames(l) <- x
  rownames(l) <- compare
  # Generate CSVs
  write.table(l, file=paste("./analysis/average-", type, "-", paste(filter, collapse="-"), paste(compare, collapse="-"), ".csv", sep=""), sep=",", quote=FALSE)
}

# Invoke generate_csv to generate rps and p99 csv
generate_csv(rps, "rps")
generate_csv(p99, "p99")
