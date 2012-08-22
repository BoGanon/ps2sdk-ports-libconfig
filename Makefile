EE_INCS += -I./lib

EE_LIB = lib/libconfig.a
EE_OBJS = lib/grammar.o lib/libconfig.o lib/scanctx.o lib/scanner.o lib/strbuf.o 

EE_CXX_LIB = lib/libconfig++.a
EE_CXX_OBJS = $(EE_OBJS) lib/libconfigcpp.o
EE_CXXFLAGS = -fno-rtti

# C compile test
TEST_OBJS = examples/c/example1.o
TEST_BIN = example1.elf
TEST_LIBS = $(EE_LIB)

# C++ compile test
TEST_CXX_OBJS = examples/c++/example1.o
TEST_CXX_BIN = example1cpp.elf
TEST_CXX_LIBS = $(EE_CXX_LIB)

all: $(EE_LIB) $(EE_CXX_LIB) $(TEST_BIN) $(TEST_CXX_BIN)

install: all
	mkdir -p $(DESTDIR)$(PS2SDK)/ports/include
	mkdir -p $(DESTDIR)$(PS2SDK)/ports/lib
	cp -f $(EE_LIB) $(DESTDIR)$(PS2SDK)/ports/lib
	cp -f $(EE_CXX_LIB) $(DESTDIR)$(PS2SDK)/ports/lib
	cp -f lib/libconfig.h $(DESTDIR)$(PS2SDK)/ports/include
	cp -f lib/libconfig.h++ $(DESTDIR)$(PS2SDK)/ports/include

clean:
	rm -f $(EE_LIB) $(EE_CXX_LIB) $(EE_CXX_OBJS) $(TEST_BIN) $(TEST_OBJS) $(TEST_CXX_BIN) $(TEST_CXX_OBJS)

include $(PS2SDK)/samples/Makefile.pref
include Makefile.eeglobal
