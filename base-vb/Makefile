#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# created:       May 31, 2018
# modified:      June 4, 2018
# description:   A makefile to build all or specified parts . . .

BOX_SUFFIX7 := -7.5.box

BOX_SUFFIX6 := -6.9.box

%$(BOX_SUFFIX7): %.json
	./build $<

%$(BOX_SUFFIX6): %.json
	./build $<

.PHONY: all clean r75 r75-dt r69 r69-i386 r69-dt r69-dt-i386

all: r75 r75-dt r69 r69-i386 r69-dt r69-dt-i386

r75: r75$(BOX_SUFFIX7)

r75-dt: r75-dt$(BOX_SUFFIX7)

r69: r69$(BOX_SUFFIX6)

r69-i386: r69-i386$(BOX_SUFFIX6)

r69-dt: r69-dt$(BOX_SUFFIX7)

r69-dt-i386: r69-dt-i386$(BOX_SUFFIX7)

clean:
	rm -rf box packer_cache CentOS*.iso

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
