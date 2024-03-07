# Makefile for PlagiarismDetector

# Compiler
CC = g++

# Flex
FLEX = flex

# Compiler flags
CFLAGS = -std=c++11 -Wall

# Source files
LEXER_SRC = lex.yy.c
CMOS_SRC = cmos.cpp

# Executable names
LEXER_EXE = lexer
CMOS_EXE = cmos

# Flex rules
$(LEXER_SRC): cmos.l
	$(FLEX) $<

# Build rule for lexer
$(LEXER_EXE): $(LEXER_SRC)
	$(CC) $(CFLAGS) -o $@ $<

# Rule to run PlagiarismDetector.sh
run_plagiarism_detector: $(LEXER_EXE)
	./PlagarismDetector.sh examples

# Build rule for CMOS
$(CMOS_EXE): $(CMOS_SRC)
	$(CC) $(CFLAGS) -o $@ $<

# Target to build lexer and run plagiarism detector
all: $(LEXER_EXE) run_plagiarism_detector $(CMOS_EXE)

# Clean rule
clean:
	rm -f $(LEXER_SRC) $(LEXER_EXE) $(CMOS_EXE)
