EMCC = emcc

CPPFLAGS = \
	-std=c++17 \
	-Wall -O2 \

EMFLAGS = \
	-s USE_SDL=2 \
	-s USE_SDL_IMAGE=2 \
	-s USE_SDL_TTF=2 \
	-s SDL2_IMAGE_FORMATS=["png"] \
	-s ALLOW_MEMORY_GROWTH=1 \
	--no-heap-copy \
	--preload-file Fonts \
	--shell-file shell_minimal.html \

TARGET := test

# $(wildcard *.cpp /xxx/xxx/*.cpp): get all .cpp files from the current directory and dir "/xxx/xxx/"
SRCS := $(wildcard *.cpp)
# $(patsubst %.cpp,%.o,$(SRCS)): substitute all ".cpp" file name strings to ".o" file name strings
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

# default
all: build

build: $(OBJS)
	$(EMCC) $(CPPFLAGS) $(EMFLAGS) $** -o $@.html

clean:
	del /f *.data *.html *.js *.wasm
