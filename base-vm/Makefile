#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# created:       May 31, 2018
# modified:      July 19, 2018
# description:   A makefile to build all or specified parts . . .

BOX_SUFFIX7 := -7.5.box

%$(BOX_SUFFIX7): %.json
	./build $<

.PHONY: all clean r75

all: r75

r75: r75$(BOX_SUFFIX7)

clean:
	rm -rf box packer_cache CentOS*.iso

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
