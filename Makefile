NAME = minishell

SRCS = src/main.c src/builtins/cd.c src/builtins/echo.c src/builtins/env.c src/builtins/exit.c \
       src/builtins/export.c src/builtins/pwd.c src/builtins/unset.c src/exec/execute_command.c \
       src/parser/parse_input.c src/redirections/handle_redirection.c src/signals/handle_signals.c \
       utils/utils.c

BONUS_SRCS = bonus/and.c bonus/or.c bonus/wildcards.c

OBJS = $(SRCS:.c=.o)
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

CFLAGS = -Wall -Wextra -Werror
INCLUDES = -I includes

all: $(NAME)

$(NAME): $(OBJS)
	cc $(CFLAGS) $(OBJS) -o $(NAME)

bonus: $(OBJS) $(BONUS_OBJS)
	cc $(CFLAGS) $(OBJS) $(BONUS_OBJS) -o $(NAME)

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
