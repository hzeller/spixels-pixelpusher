CXXFLAGS=-Wall -O3 -g
OBJECTS=spixels-pixel-push.o
BINARIES=spixels-pixel-push

SPIXELS_INCDIR=spixels/include
SPIXELS_LIBDIR=spixels/lib
SPIXELS_LIBRARY_NAME=spixels
SPIXELS_LIBRARY=$(SPIXELS_LIBDIR)/lib$(SPIXELS_LIBRARY_NAME).a

PP_INCDIR=pp-server/include
PP_LIBDIR=pp-server/lib
PP_LIBRARY_NAME=pixel-push-server
PP_LIBRARY=$(PP_LIBDIR)/lib$(PP_LIBRARY_NAME).a

LDFLAGS+=-L$(PP_LIBDIR) -l$(PP_LIBRARY_NAME) \
         -L$(SPIXELS_LIBDIR) -l$(SPIXELS_LIBRARY_NAME) \
          -lrt -lm -lpthread

all : spixels-pixel-push

spixels-pixel-push : $(OBJECTS) $(SPIXELS_LIBRARY) $(PP_LIBRARY)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

$(SPIXELS_LIBRARY): FORCE
	$(MAKE) -C $(SPIXELS_LIBDIR)

$(PP_LIBRARY): FORCE
	$(MAKE) -C $(PP_LIBDIR)

spixels-pixel-push.o : spixels-pixel-push.cc

%.o : %.cc
	$(CXX) -I$(PP_INCDIR) -I$(SPIXELS_INCDIR) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJECTS) $(BINARIES)
	$(MAKE) -C $(SPIXELS_LIBDIR) clean
	$(MAKE) -C $(PP_LIBDIR) clean

FORCE:
.PHONY: FORCE
