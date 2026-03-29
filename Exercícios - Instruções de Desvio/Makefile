PROGRAMAS = par_impar ordena_dois ordena_tres fatorial soma_valores

all: $(PROGRAMAS)

%: %.s
	as $^ -o $@.o
	gcc $@.o -o $@ -nostartfiles -no-pie -lc -e main
	rm $@.o
