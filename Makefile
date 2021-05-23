NAME = libft.a

CC = clang
CFLAGS = -Wall -Wextra -Werror -I includes/

HEADER = ./includes/libft.h

FREE = ft_free_array

IS = ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_isprint

LST_ORIGINAL = ft_lstadd_back ft_lstadd_front ft_lstclear ft_lstdelone \
				ft_lstiter ft_lstlast ft_lstmap ft_lstnew ft_lstsize

MATH = ft_pow

MEM = ft_bzero ft_calloc ft_memccpy ft_memchr ft_memcmp ft_memcpy ft_memmove \
		ft_memset

PUT = ft_putchar_fd ft_putendl_fd ft_putnbr_fd ft_putstr_fd

STRING = ft_split2 ft_strchr ft_strdup ft_strjoinchr_bonus ft_strlcpy \
		ft_strmapi ft_strnstr ft_strtrim ft_split ft_strcmp_bonus ft_strjoin \
		ft_strlcat ft_strlen ft_strncmp ft_strrchr ft_substr

TO = ft_atoi ft_itoa_longlong ft_itoa_unsigned_longlong ft_itoa ft_tolower \
	ft_toupper

SRC = $(addsuffix .c, $(addprefix sources/free/, $(FREE))) \
	$(addsuffix .c, $(addprefix sources/is/, $(IS))) \
	$(addsuffix .c, $(addprefix sources/lst/original/, $(LST_ORIGINAL))) \
	$(addsuffix .c, $(addprefix sources/math/, $(MATH))) \
	$(addsuffix .c, $(addprefix sources/mem/, $(MEM))) \
	$(addsuffix .c, $(addprefix sources/put/, $(PUT))) \
	$(addsuffix .c, $(addprefix sources/string/, $(STRING))) \
	$(addsuffix .c, $(addprefix sources/to/, $(TO)))

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\n\n\033[0;32mLibft compiled!"
	@ar rc $(NAME) $^
	@ranlib $(NAME)
	@echo "\033[0m"

%.o: %.c
	@printf "\033[0;33mGenerating libft objects... %-33.33s\r" $@
	@${CC} ${CFLAGS} -c $< -o $@

clean:
	@rm -f $(OBJ)
	@echo "\n\033[0;32mLibft *o removed!"

fclean: clean
	@rm -f $(NAME)
	@echo "\033[0;32mLibft libft.a removed!"

re: fclean all

norm:
	norminette $(SRC) $(HEADER)

.PHONY: all clean fclean re norm