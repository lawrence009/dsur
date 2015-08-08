#http://www.ssa.gov/OACT/babynames/limits.html

#http://www.ssa.gov/OACT/babynames/names.zip
#http://www.ssa.gov/OACT/babynames/state/namesbystate.zip



download.data <- function(url, filename) {
    if(!file.exists(file.path(dataDir, filename))) {
        download.file(url = paste(url, filename, sep = '/'),
                      destfile = file.path(dataDir, filename))
        unzip(file.path(dataDir, filename), exdir = dataDir)
    }
}

if (!dir.exists(dataDir)) {
    dir.create(dataDir)
}

url <- 'http://www.ssa.gov/OACT/babynames'
dataDir <- file.path('data', 'ssa.gov')

download.data(url, 'names.zip')
download.data(paste(url, 'state', sep = '/'), 'namesbystate.zip')

