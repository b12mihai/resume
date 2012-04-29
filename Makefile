TEX = cv_Mihai_Barbulescu.tex
PDF = $(TEX:.tex=.pdf)
PDFLATEX = pdflatex
CLEAN_FILES = *.aux *.log *.out

.PHONY: clean all

all: $(PDF)

$(PDF): %.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<	# Twice, so TOC is also updated

clean:
	-rm -f $(CLEAN_FILES) *~
