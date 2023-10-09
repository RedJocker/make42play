FILES = a.c \
	b.c \
	c.c
H_DIR = ./includes
OBJS_DIR = ./objs
SRC_DIR = ./srcs
VPATH = $(OBJS_DIR) $(SRC_DIR) $(H_DIR)
DEP_FILES = $(addprefix $(OBJS_DIR)/,$(patsubst %.c,%.d,$(FILES)))
OBJS = $(addprefix $(OBJS_DIR)/,$(patsubst %.c,%.o,$(FILES)))
DEP_FLAGS =  -MP -MD
CFLAGS = -Wall -Wextra -Werror
CC = clang

all: $(OBJS)
	@echo "this is all $^"

$(OBJS) : $(OBJS_DIR)/%.o : %.c | $(OBJS_DIR)   
	$(CC) $(CFLAGS) -c $< -o ./$@ $(DEP_FLAGS)

$(OBJS_DIR):
	mkdir $(OBJS_DIR)

.Phony: clean see

see: 
	@echo "$(DEP_FILES)"

clean:
	rm -fr $(OBJS_DIR)

-include $(DEP_FILES)
