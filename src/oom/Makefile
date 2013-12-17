OPTIMIZATION?=-O0
DEBUG?=-g -ggdb -rdynamic

all: oom

clean:
		rm -f *.o oom

.PHONY: all clean

oom: oom.o
		$(CC) -static -o $@ $^ -lutil

%.o: %.c
		$(CC) -c -Wall -D_GNU_SOURCE $(OPTIMIZATION) $(DEBUG) $(CFLAGS) $<
