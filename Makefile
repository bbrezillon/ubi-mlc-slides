
PICTURES = \
	common/logo-penguins.pdf \
	common/logo-square.pdf \
	pairing-scheme.pdf \
	slc-mlc-cell.pdf \
        ubi-peb-consolidation-workflow.pdf

all: $(PICTURES)
	$(PDFLATEX_ENV) pdflatex -shell-escape ubi-mlc.tex

%.pdf: %.svg
	inkscape -D -A $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	$(RM) -r *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log _minted*
