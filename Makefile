
ORG = 0x0200
NAME = cromenco4pio

all:	$(NAME).ptp

$(NAME).ptp: $(NAME).bin Makefile
	
	srec_cat ./output/$(NAME).bin -binary -offset $(ORG) -o ./output/$(NAME).ptp -MOS_Technologies

$(NAME).bin: $(NAME).o
	
	ld65 -t none -vm -m ./output/$(NAME).map -o ./output/$(NAME).bin ./output/$(NAME).o

$(NAME).o: $(NAME).s
	
	ca65 -v -l ./output/$(NAME).lst -o ./output/$(NAME).o --feature labels_without_colons $(NAME).s

clean:
	
	$(RM) ./output/*.o ./output/*.lst ./output/*.map ./output/*.bin ./output/*.ptp

distclean: clean
