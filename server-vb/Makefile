#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# created:       May 31, 2018
# modified:      July 18, 2018
# description:   A makefile to build all or specified parts . . .

BOX_SUFFIX := -2018.5.30.box

%$(BOX_SUFFIX): %.json
	./build $<

.PHONY: all clean 75 75-dt

all: 75 75-dt

75: 75$(BOX_SUFFIX)

75-dt: 75-dt$(BOX_SUFFIX)

clean:
	rm -rf box packer_cache CentOS*.iso

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
