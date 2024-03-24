# Generate your PDF
.PHONY: always_rebuild

%.pdf : %.tex always_rebuild
	@echo '.........: pdflatex running pass 1...'
	lualatex $< -o $@ 2>&1 | tee errors.err
	@echo '.........: bibtex running...'
	bibtex $(basename $<) 2>&1 | tee errors.err
	@echo '.........: pdflatex running pass 2...'
	lualatex $< -o $@ 2>&1 | tee errors.err
	@echo '.........: pdflatex and bibtex run finished.'
# Clean temp files
clean :
	rm -f *.o errors.err
	rm -f *.aux *.bbl *.blg *.log *.out
	rm -f *.synctex.gz
	rm -f BUILD
	@echo

copy:
	-rm /mnt/c/Users/andre/OneDrive/Corinna/planer.pdf
	cp planer.pdf /mnt/c/Users/andre/OneDrive/Corinna/
