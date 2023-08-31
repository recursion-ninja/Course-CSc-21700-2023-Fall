doc-dir := ./Documents
set-dir := ./Problem-Sets/Set-
lab-dir := ./Program-Labs/Lab-

all: $(doc-dir)/Syllabus.pdf $(doc-dir)/Problem-Set-1 $(doc-dir)/Problem-Set-2

$(doc-dir)/Syllabus.pdf: README.md
	pandoc \
	  --from=gfm \
	  --to=pdf \
	  --output=$@ \
	  $<

$(doc-dir)/Problem-Set-1: $(set-dir)1/Problem-Set-1.tex
	latexmk -pdf -auxdir=$(set-dir)1 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)1 $<

$(doc-dir)/Problem-Set-2: $(set-dir)2/Problem-Set-2.tex
	latexmk -pdf -auxdir=$(set-dir)2 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)2 $<
