# Makefile for Plagiarism Detector

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -std=c++11

# Lex file
LEX = flex

# Flex flags
LEXFLAGS =

# Source files
SRC = cmos.cpp

# Flex-generated file
FLEX_SRC = lex.yy.cpp

# Object files
OBJ = $(SRC:.cpp=.o) $(FLEX_SRC:.cpp=.o)

# Target executable
TARGET = PlagiarismDetector

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Generate Flex source file
$(FLEX_SRC): cmos.l
	$(LEX) $(LEXFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(TARGET) $(FLEX_SRC)

