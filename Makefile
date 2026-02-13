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
	$(TEX) $(TXF)

$(BBO): $(BBF)
	$(BIB) $(PRE)
	$(TEX) $(TXF)

clean: outclean cacheclean

outclean:
	rm -f $(PRE).log $(PRE).pdf

cacheclean:
	rm -f $(PRE).aux $(PRE).bbl $(PRE).bcf $(PRE).blg $(PRE).run.xml

.PHONY: clean outclean cacheclean
