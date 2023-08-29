Syllabus.pdf: README.md
	pandoc \
	  --from=gfm \
	  --to=pdf \
	  --output=$@ \
	  $<
