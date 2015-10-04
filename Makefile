TEX         = pdflatex
FILE1       = BDDs-Aula1
FILE2       = BDDs-Aula2
OUTPUT_DIR  = output
TEXMFOUTPUT = $(OUTPUT_DIR)
FORMAT     ?= full

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

ifeq ($(FORMAT),wide)
    ASPECTRATIO1 = "\def\classopts{,aspectratio=169}\input{" $(FILE1) "}"
    ASPECTRATIO2 = "\def\classopts{,aspectratio=169}\input{" $(FILE2) "}"
    JOBNAME1 = $(FILE1)-wide
    JOBNAME2 = $(FILE2)-wide
else
    ASPECTRATIO1 = ""
    ASPECTRATIO2 = ""
    JOBNAME1 = $(FILE1)-full
    JOBNAME2 = $(FILE2)-full
endif

all: aula1 aula2

aula1: $(FILE1).tex
ifeq ($(OS),Windows_NT)
	if not exist $(OUTPUT_DIR) $(MD) $(OUTPUT_DIR)
else
	$(MD) $(OUTPUT_DIR)
endif
	$(TEX) $(ASPECTRATIO1) -job-name=$(JOBNAME1) -output-directory $(OUTPUT_DIR) $(FILE1).tex
	
aula2: $(FILE2).tex
ifeq ($(OS),Windows_NT)
	if not exist $(OUTPUT_DIR) $(MD) $(OUTPUT_DIR)
else
	$(MD) $(OUTPUT_DIR)
endif
	$(TEX) $(ASPECTRATIO2) -job-name=$(JOBNAME2) -output-directory $(OUTPUT_DIR) $(FILE2).tex

clean:
	$(RM) $(OUTPUT_DIR)$(SEP)*.aux  $(OUTPUT_DIR)$(SEP)*.log\
    $(OUTPUT_DIR)$(SEP)*.toc $(OUTPUT_DIR)$(SEP)*.out\
    $(OUTPUT_DIR)$(SEP)*.blg $(OUTPUT_DIR)$(SEP)*.bbl\
    $(OUTPUT_DIR)$(SEP)*.nav $(OUTPUT_DIR)$(SEP)*.snm

clean_all: clean
	$(RM) $(OUTPUT_DIR)$(SEP)*.pdf