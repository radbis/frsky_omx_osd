
VGFONTPATH=/opt/vc/src/hello_pi/libs/vgfont
HELLOFONTPATH=/opt/vc/src/hello_pi/hello_font/

CPPFLAGS+= -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -I$(VGFONTPATH)
LDFLAGS+= -L$(VGFONTPATH) -lvgfont -lfreetype -lz
LDFLAGS+=-L/opt/vc/lib/ -lGLESv2 -lEGL -lopenmaxil -lbcm_host -lvcos -lvchiq_arm -lpthread -lrt -lm

all: frsky_omx_osd

vgfont:
	cp $(HELLOFONTPATH)/Vera.ttf .
	make -C $(VGFONTPATH)

frsky_omx_osd: vgfont main.c
	gcc -Wall $(CPPFLAGS) main.c -o frsky_omx_osd $(LDFLAGS)


clean:
	rm -f frsky_omx_osd *~

