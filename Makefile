TEX := xelatex -interaction=batchmode
BIB := biber -q
PRE := balltime
TXF := $(PRE).tex
BBF := $(PRE).bib
TXO := $(PRE).aux
BBO := $(PRE).bbl
OUT := $(PRE).pdf

$(OUT): $(TXF) $(BBO)
	$(TEX) $(TXF)
	$(TEX) $(TXF)

$(TXO): $(TXF)
	$(TEX) $(TXF)

$(BBO): $(BBF) $(TXO)
	$(BIB) $(PRE)

clean: outclean cacheclean

outclean:
	rm -f $(OUT) $(PRE).log

cacheclean:
	rm -f $(TXO) $(BBO) $(PRE).bcf $(PRE).blg $(PRE).run.xml

.PHONY: clean outclean cacheclean
