
PICTURES = \
	common/logo-penguins.pdf \
	common/logo-square.pdf \
	pairing-scheme.pdf \
	slc-mlc-cell.pdf \
	ubi-peb-consolidation-workflow.pdf \
	ubi_mlc_conso.pdf \
	ubi_mlc_slcmode.pdf \
	ubi_slc.pdf

all: $(PICTURES)
	$(PDFLATEX_ENV) pdflatex -shell-escape ubi-mlc.tex

%.pdf: %.odg
	bash -c "soffice --headless --convert-to pdf $^"

%.pdf: %.svg
	inkscape -D -A $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	mv ubi-nonfastmap.pdf ubi-nonfastmap.pdf.keep
	$(RM) -r common/*.pdf *.pdf *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log _minted*
	mv ubi-nonfastmap.pdf.keep ubi-nonfastmap.pdf
