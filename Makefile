JUNK_FILES=*.aux *.log styles/*.aux *.dvi *.pdf

release: clean view

view: resume.pdf
	open resume.pdf
	cp resume.pdf ~/Dropbox/jobs/

resume.pdf: resume.dvi
	dvipdfmx resume.dvi

resume.dvi:
	latex -halt-on-error resume.tex

clean:
	rm -rf $(JUNK_FILES)
	find . -name "*.aux" -exec rm {} \;
