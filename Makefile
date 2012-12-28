TEX = cv_ro.tex
PDF = $(TEX:.tex=.pdf)
PDFLATEX = pdflatex
PDFVIEW = evince
CLEAN_FILES = *.aux *.log *.out *.dvi

.PHONY: clean all

all: $(PDF)
	mv $(PDF) pdf/
	$(PDFVIEW) pdf/$(PDF) &

$(PDF): %.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<	# Twice, so TOC is also updated

clean:
	-rm -f $(CLEAN_FILES) *~
