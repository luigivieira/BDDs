TEX=pdflatex
FILE=Aula-DDBs
OUTPUT_DIR=output
TEXMFOUTPUT=$(OUTPUT_DIR)

# Definition of basic commands according to the operating system.
$(info Target platform: $(OS))
ifeq ($(OS),Windows_NT)
	RM=del /s/q
	MD=mkdir
	SEP=\\
	CP=copy
else
	RM=rm -rf
	MD=mkdir -p
	SEP=/
	CP=cp
endif

all: wide

full: ASPECTRATIO = ""
full: build
	$(CP) $(OUTPUT_DIR)$(SEP)$(FILE).pdf $(OUTPUT_DIR)$(SEP)$(FILE)_full.pdf
	$(RM) $(OUTPUT_DIR)$(SEP)$(FILE).pdf
    
wide: ASPECTRATIO = "\def\classopts{,aspectratio=169}\input{" $(FILE) "}"
wide: build
	$(CP) $(OUTPUT_DIR)$(SEP)$(FILE).pdf $(OUTPUT_DIR)$(SEP)$(FILE)_wide.pdf
	$(RM) $(OUTPUT_DIR)$(SEP)$(FILE).pdf

build: $(FILE).tex
ifeq ($(OS),Windows_NT)
	if not exist $(OUTPUT_DIR) $(MD) $(OUTPUT_DIR)
else
	$(MD) $(OUTPUT_DIR)
endif
	$(TEX) $(ASPECTRATIO) -output-directory $(OUTPUT_DIR) $(FILE).tex

clean:
	$(RM) $(OUTPUT_DIR)$(SEP)$(FILE).aux  $(OUTPUT_DIR)$(SEP)$(FILE).log\
    $(OUTPUT_DIR)$(SEP)$(FILE).toc $(OUTPUT_DIR)$(SEP)$(FILE).out\
    $(OUTPUT_DIR)$(SEP)$(FILE).blg $(OUTPUT_DIR)$(SEP)$(FILE).bbl\
    $(OUTPUT_DIR)$(SEP)$(FILE).nav $(OUTPUT_DIR)$(SEP)$(FILE).snm

clean_all: clean
	if exist $(OUTPUT_DIR)$(SEP)$(FILE)_full.pdf $(RM) $(OUTPUT_DIR)$(SEP)$(FILE)_full.pdf
	if exist $(OUTPUT_DIR)$(SEP)$(FILE)_wide.pdf $(RM) $(OUTPUT_DIR)$(SEP)$(FILE)_wide.pdf