#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# created:       May 31, 2018
# modified:      July 19, 2018
# description:   A makefile to build all or specified parts . . .

BOX_SUFFIX7 := -7.5.box

BOX_SUFFIX6 := -6.10.box

%$(BOX_SUFFIX7): %.json
	./build $<

%$(BOX_SUFFIX6): %.json
	./build $<

.PHONY: all clean r75 r75-dt r610 r610-i386 r610-dt r610-dt-i386

all: r75 r75-dt r610 r610-i386 r610-dt r610-dt-i386

r75: r75$(BOX_SUFFIX7)

r75-dt: r75-dt$(BOX_SUFFIX7)

r610: r610$(BOX_SUFFIX6)

r610-i386: r610-i386$(BOX_SUFFIX6)

r610-dt: r610-dt$(BOX_SUFFIX7)

r610-dt-i386: r610-dt-i386$(BOX_SUFFIX7)

clean:
	rm -rf box packer_cache CentOS*.iso

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
