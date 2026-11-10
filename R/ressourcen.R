# Ausschliesslich paketinterne, verlustfrei komprimierte JSON-Ressourcen.
.ressource <- function(datei) {
  pfad <- system.file("extdata", paste0(datei, ".gz"),
    package = "euaiact", mustWork = TRUE)
  verbindung <- gzfile(pfad, open = "rb")
  on.exit(close(verbindung), add = TRUE)
  jsonlite::fromJSON(verbindung, simplifyVector = FALSE)
}
