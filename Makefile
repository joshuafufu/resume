JUNK_FILES=*.aux *.log styles/*.aux *.dvi *.pdf

release: clean copy 

copy: resume.pdf resume-chs.pdf
	cp resume.pdf ~/Dropbox/jobs/
	cp resume-chs.pdf ~/Dropbox/jobs/

resume.pdf: resume.dvi
	dvipdfmx resume.dvi

resume.dvi:
	latex -halt-on-error resume.tex

resume-chs.pdf:
	xelatex -halt-on-error resume-chs.tex

clean:
	rm -rf $(JUNK_FILES)
	find . -name "*.aux" -exec rm {} \;
