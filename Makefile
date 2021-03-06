# see http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: main.pdf all clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: main.pdf

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

# Have to compile twice because of the header
main.pdf: cv_10.tex
	xelatex -output-dir output cv_10.tex
	xelatex -output-dir output cv_10.tex

clean:
	find ./output -iname '*.aux' | xargs rm
	find ./output -iname '*.log' | xargs rm
	find ./output -iname '*.out' | xargs rm
	find ./output -iname '*.bcf' | xargs rm
	find ./output -iname '*.run.xml' | xargs rm

