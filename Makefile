# Main variables
SOURCEDIR = src
OBJECTSDIR = objects

CSOURCES = $(wildcard $(SOURCEDIR)/*.c) $(wildcard $(SOURCEDIR)/**/*.c)
HSOURCES = $(wildcard $(SOURCEDIR)/*.h)
COBJECTS = $(patsubst $(SOURCEDIR)/%.c, $(OBJECTSDIR)/%.o, $(CSOURCES))
HOBJECTS := $(patsubst $(SOURCEDIR)/%.h, $(OBJECTSDIR)/%.o, $(HSOURCES))

# Main methods
all: printy
 
printy: $(COBJECTS)
	@tcc -m32 $^ -o printy

$(COBJECTS): $(CSOURCES) $(HSOURCES) $(OBJECTSDIR)
	@-mkdir "$(subst $(lastword $(subst /, ,$@)),,$@)"
	@tcc -m32 -c $(patsubst $(OBJECTSDIR)/%.o, $(SOURCEDIR)/%.c, $@) -o $@

$(OBJECTSDIR):
	@-mkdir $(OBJECTSDIR)

clean:
	@-del /f /s /q $(OBJECTSDIR)
	@-rmdir /s /q $(OBJECTSDIR)
	@-del /f /s /q printy

.PHONY: all clean
