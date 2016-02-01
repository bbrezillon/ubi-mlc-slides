
PICTURES = \
	common/logo-penguins.pdf \
	common/logo-square.pdf \
	ubi-slc-vs-mlc.pdf \
	ubi-peb-consolidation.pdf \
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
	$(RM) common/*.pdf *.pdf *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log
