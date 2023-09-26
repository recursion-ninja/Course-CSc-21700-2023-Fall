doc-dir := ./Documents
exam-dir := ./Exams
lab-dir := ./Program-Labs/Lab-
set-dir := ./Problem-Sets/Set-

ext-pdf := .pdf

all: $(doc-dir)/Syllabus$(ext-pdf) $(doc-dir)/Problem-Set-1$(ext-pdf) $(doc-dir)/Problem-Set-2$(ext-pdf) $(doc-dir)/Problem-Set-3$(ext-pdf) $(doc-dir)/Problem-Set-4$(ext-pdf) $(doc-dir)/Exam-1-Sample$(ext-pdf)

$(doc-dir)/Syllabus.pdf: README.md
	pandoc \
	  --from=gfm \
	  --to=pdf \
	  --output=$@ \
	  $<

$(doc-dir)/Problem-Set-1$(ext-pdf): $(set-dir)1/Problem-Set-1.tex
	latexmk -pdf -auxdir=$(set-dir)1 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)1 $<

$(doc-dir)/Problem-Set-2$(ext-pdf): $(set-dir)2/Problem-Set-2.tex
	latexmk -pdf -auxdir=$(set-dir)2 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)2 $<

$(doc-dir)/Problem-Set-3$(ext-pdf): $(set-dir)3/Problem-Set-3.tex
	latexmk -pdf -auxdir=$(set-dir)3 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)3 $<

$(doc-dir)/Problem-Set-4$(ext-pdf): $(set-dir)4/Problem-Set-4.tex
	latexmk -pdf -auxdir=$(set-dir)4 -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(set-dir)4 $<

$(doc-dir)/Exam-1-Sample$(ext-pdf): $(exam-dir)/Exam-1-Sample.tex
	latexmk -pdf -auxdir=$(exam-dir) -output-directory=$(doc-dir) $<
	latexmk -c   -auxdir=$(exam-dir) $<
