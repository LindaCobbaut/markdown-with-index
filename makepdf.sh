#!/bin/bash
#
# build a pdf file from markdown, with an index
#

# remove files from previous build
rm output.* 2>/dev/null

# automagically make all words marked as strong in markdown indexed
# this sed searches for **foo** and appends \index{foo}
 cat  ~/cursusnetwerk/topics/git_inleiding/theorie.md  | sed -e 's/\*\*\([^*]*\)\*\*/\*\*\1\*\*\\index{\1}/g' > cursusnetwerk.md

# yes, the above is an example of useless use of cat ;-)

# uncomment the following two lines if you want to remove all pagebreaks
# grep -v newpage cursusnetwerk.md > cursusnetwerk2.md
# pandoc -s cursusnetwerk.md --template=mytemplate.tex -o output.tex

# uncomment this line to keep the linebreaks
pandoc -s cursusnetwerk.md --template=mytemplate.tex -o output.tex

pdflatex output.tex 
makeindex output
pdflatex output.tex 
# the pdf is ready

