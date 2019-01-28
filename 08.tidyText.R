
# \\b word boundaries
str <- " hello world "
gsub("\\b", "_", str)
### [1] "_ _h_e_l_l_o_ _w_o_r_l_d_ _"

str <- " hello world "
gsub("\\w", "*", str)
### [1] " ***** ***** "

str <- " hello world "
gsub("\\s+", "*", str)
### [1] "*hello*world*"

str <- " hello world "
gsub("[:blank:]+", "*", str)
### [1] "*hello*world*"

str <- " hello world "
gsub("[^a-z]+", "*", str)
### [1] "*hello*world*"

lines <- c("https://abcde love you",
           " https://dafds love you",
           "@https://dafds love you",
           " @https://dafds love you",
           "love you https://dafds",
           "love you https://dafds ",
           "love https://dafds you",
           "love @https://abcde@ you",
           "love @https://abcde@fgh you",
           "love you@https://abcde@fgh you",
           "love youhttps://abcdefgh you",
           "http://http://",
           "http://abcde love you",
           "@jd", "love you @dsfds", "@sdfad love you", "@@dfasdf love you", "@@",
           "(http://)")
gsub("([^[:space:]]*)(@|#|http://|https://)([^[:space:]]*)", " ", lines)


# replace all non-alphabetic characters with a space at the beginning/end of a word.
lines <- c("9hello@",
           " @hello @world ",
           "hello@world",
           " hello world@",
           "3456789",
           "#$%^& 345678",
           "'hello world",
           "hello world'",
           "hello-world",
           "i'm gas-lighting u 4u b2b")
lines <- gsub("^[^a-z]+|[^a-z]+$", " ", lines) # at the begining/end of a line
lines <- gsub("[^a-z]+\\s", " ", lines) # before space
gsub("\\s[^a-z]+", " ", lines) # after space



# replace words that contain any non-alphabetic characters (excpet "-", "'")
lines <- c("i'm",
           'gas-lighting',
           "i'm gas-lighting",
           "i-love-you",
           "i@u",
           "b2b",
           "i'm gas-lighting u and you and you i@u b2b",
           " he@llo wor$ld how*are&you ")
# replace word at the beginning/end of a string
lines <- gsub("^[a-z]+[^a-z'-]+[^[:blank:]]*", " ", lines); lines
lines <- gsub("[^[:blank:]]*[^a-z'-]+[a-z]+\\s*$", " ", lines); lines
# replace words after a space
gsub("\\s[a-z]+[^a-z'-]+[^[:blank:]]*", " ", lines)


# split a string at spaces then remove the words 
# that contain any non-alphabetic characters (excpet "-", "'")
# then paste them together (separate them with spaces)
unlist(lapply(lines, function(line){
  words <- unlist(strsplit(line, "\\s+"))
  words <- words[!grepl("[^a-z'-]", words, perl=TRUE)]
  paste(words, collapse=" ")}))

str <- "i'm gas-lighting u and you and you i@u b2b"
words <- unlist(strsplit(str, "\\s+"))
words[!grepl("[^a-z'-]+", words, perl=TRUE)]


