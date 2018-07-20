#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# created:       May 31, 2018
# modified:      July 20, 2018
# description:   A makefile to build all or specified parts . . .

BOX_SUFFIX := -2018.7.20.box

%$(BOX_SUFFIX): %.json
	./build $<

.PHONY: all clean 75

all: 75

75: 75$(BOX_SUFFIX)

clean:
	rm -rf box packer_cache CentOS*.iso

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
