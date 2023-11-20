CXXFLAGS += -std=c++20 -Wall -Wextra
LDFLAGS += 

SOURCES = main.cpp
OBJS = $(SOURCES:.cpp=.o)
NAME = program

.PHONY: clean release debug

release: CXXFLAGS += -O3 -march=native -DNDEBUG
release: $(NAME)

debug: CXXFLAGS += -g
debug: $(NAME)

$(NAME): $(OBJS)
	$(CXX) -o $@ $(OBJS) $(LDFLAGS)

$(OBJS): $(SOURCES)
	$(CXX) -c $< $(CXXFLAGS)

clean:
	rm -f $(OBJS) $(NAME)
