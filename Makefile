TEX := xelatex -interaction=batchmode
BIB := biber -q


PRE := balltime
TXF := $(PRE).tex
BBF := $(PRE).bib

TXO := $(PRE).aux
BBO := $(PRE).bbl
OUT := $(PRE).pdf

$(OUT): $(TXO) $(BBO)

$(TXO): $(TXF)
	$(TEX) $(TXF) # Run XELATEX

$(BBO): $(BBF)
	$(BIB) $(PRE) # Update biblatex stuff
	$(TEX) $(TXF) # Update references in TeX
	$(TEX) $(TXF) # Generate final updated pdf with references

clean: outclean cacheclean

outclean:
	rm -f $(PRE).log $(PRE).pdf

cacheclean:
	rm -f $(PRE).aux $(PRE).bbl $(PRE).bcf $(PRE).blg $(PRE).run.xml

.PHONY: clean outclean cacheclean
