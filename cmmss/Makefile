CC ?= cc
LIPO ?= lipo
CFLAGS := -framework CoreFoundation -framework IOKit -mmacosx-version-min=10.4

all: kma

kma.x86: kma.c
	$(CC) $< $(CFLAGS) -target x86_64-apple-darwin -o $@

kma.arm: kma.c
	$(CC) $< $(CFLAGS) -target arm64-apple-darwin -o $@

kma: kma.x86 kma.arm
	$(LIPO) $^ -create -output $@

clean:
	rm -f kma.x86 kma.arm kma

.PHONY: all clean
