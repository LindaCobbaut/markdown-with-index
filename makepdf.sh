rm output.*
pandoc -s ../../topics/git_inleiding/theorie.md --template=../mytemplate.tex -o output.tex
pdflatex output.tex 
makeindex output
pdflatex output.tex 

