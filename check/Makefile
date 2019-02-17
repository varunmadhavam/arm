MCPU    = cortex-m0plus
OUTPUT  = $(shell basename "`pwd`")
CC      = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump
FLAGS   = -mcpu=$(MCPU) -mthumb
OPT     = -Og
CFLAGS  = $(FLAGS) $(OPT) -I./src -fno-common -g3 -Wall -Werror -Wextra -ffunction-sections -fdata-sections 
DFLAGS  = -MM
LDFLAGS = $(FLAGS) -Tsrc/standard.ld -Xlinker --gc-sections -Xlinker -Map=$(TMP)/$(OUTPUT).map -nostartfiles -nostdlib -lnosys
DEPS    = 
TMP     = tmp
SRC     = src
BIN     = bin
SRCS    = $(wildcard $(SRC)/*.c)
HEADERS = $(wildcard $(SRC)/*.h)
OBJS    = $(patsubst $(SRC)/%.c,$(TMP)/%.o,$(SRCS))

.PHONY: all clean

all: $(BIN)/$(OUTPUT).asm $(BIN)/$(OUTPUT).bin

$(BIN)/$(OUTPUT).bin: $(BIN)/$(OUTPUT).elf
	$(OBJCOPY) $< -O binary $@

$(BIN)/$(OUTPUT).asm: $(BIN)/$(OUTPUT).elf
	$(OBJDUMP) -S $< > $@

$(TMP)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<
	$(CC) $(DFLAGS) $<  | sed -e 's/^/$(TMP)\//'  > $(TMP)/$*.d

bin/$(OUTPUT).elf: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f bin/* tmp/*

-include $(OBJS:.o=.d)
