
# WordNet

# C:\Program Files\Java\jdk-11.0.2\bin
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk-11.0.2')
Sys.setenv(WNHOME = "C:/Program Files (x86)/WordNet/2.1")
setDict("C:/Program Files (x86)/WordNet/2.1/")
library(wordnet)
getFilterTypes()

filter <- getTermFilter("StartsWithFilter", "car", TRUE)
terms <- getIndexTerms("NOUN", 5, filter)
sapply(terms, getLemma)

filter <- getTermFilter("StartsWithFilter", "live", TRUE)
terms <- getIndexTerms("VERB", 5, filter)
sapply(terms, getLemma)

antonyms <- function(x){
  filter <- getTermFilter("ExactMatchFilter", x, TRUE)
  terms <- getIndexTerms("ADJECTIVE", 5, filter)
  synsets <- getSynsets(terms[[1]])
  related <- tryCatch(
    getRelatedSynsets(synsets[[1]], "!"),
    error = function(condition) {
      message("No direct antonym found")
      if (condition$message == "RcallMethod: invalid object parameter")
        message("No direct antonym found")
      else
        stop(condition)
      return(NULL)
    }
  )
  if (is.null(related))
    return(NULL)
  return(sapply(related, getWord))
}
antonyms("happy")
antonyms("aggressive")
