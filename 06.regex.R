
str <- "@#$hello$% $%^&world$%^"
str <- " hello$% $%^&world "
str <- " hello $%^&world "
str <- "$%^hello#$%^YU"
str <- "#$i'm%^&"
str <- "I'm. saying. you , are a idiot."

# replace all non-alphanumeric characters with a space at the beginning and at the end of a word.
gsub("^[^[:alnum:]]+|[^[:alnum:]]+$", " ", str)
gsub("[^[:alnum:]]+\\s", " ", str) # before space
gsub("\\s[^[:alnum:]]+", " ", str) # after space
gsub("[^[:alnum:]]+\\s|\\s[^[:alnum:]]+", " ", str) # before or after space

gsub("\\W", " ", str)
gsub("\\w", " ", str)

str <- ". , ,,, ."
gsub("\\.+|,+", "o", str)

str <- "hello world hi "
# word boundaries? character boundaries?
gsub("\\b", "_", str)

library(tm)
stopwords("en")

str <- "i'm doing it0!ðÿ " 
gsub("[^ai]+$", " ", str)
gsub("[^a-z0-9]+$", " ", str)

str <- "1.2,3:4;5~6!7@8#9$10%11^12&13*14(15)16_17+18-19=20[21]22{23}24\25|26?27/28<29>30"
unlist(strsplit(str, "[[:punct:]]+")) # it works
unlist(strsplit(str, "[[]]+")) # [] doesn't work
unlist(strsplit(str, "[.,:;!?(){}<>]+")) # this works.
