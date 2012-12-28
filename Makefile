TEX_RO = cv_ro.tex
PDF_RO = $(TEX_RO:.tex=.pdf)
TEX_EN = cv_en.tex
PDF_EN = $(TEX_EN:.tex=.pdf)
PDFLATEX = pdflatex
PDFVIEW = evince
CLEAN_FILES = *.aux *.log *.out *.dvi

.PHONY: clean all

rom: $(PDF_RO)
	mv $(PDF_RO) pdf/
	$(PDFVIEW) pdf/$(PDF_RO) &

eng: $(PDF_EN)
	mv $(PDF_EN) pdf/
	$(PDFVIEW) pdf/$(PDF_EN) &


$(PDF_RO): $(TEX_RO) $(PDF_RO)
	$(PDFLATEX) $<
	$(PDFLATEX) $<	# Twice, so TOC is also updated

$(PDF_EN): $(TEX_EN) $(PDF_EN)
	$(PDFLATEX) $<
	$(PDFLATEX) $<	# Twice, so TOC is also updated


clean:
	-rm -f $(CLEAN_FILES) *~
