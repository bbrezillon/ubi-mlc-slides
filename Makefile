
PICTURES = \
	common/logo-penguins.pdf \
	common/logo-square.pdf \
	pairing-scheme.pdf \
	slc-mlc-cell.pdf \
	ubi-peb-consolidation-workflow.pdf \
	ubi-mlc-leb-state.pdf \
	ubi-mlc-leb-state-v2.pdf

all: $(PICTURES)
	$(PDFLATEX_ENV) pdflatex -shell-escape ubi-mlc.tex

%.pdf: %.odg
	libreoffice --headless --convert-to pdf $^

%.pdf: %.svg
	inkscape -D -A $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	$(RM) -r $(PICTURES) *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log _minted*
