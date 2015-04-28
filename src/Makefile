################################################################################
#                                                                              #
#                       Makefile in 3_langage de modules                       #
#                       For Epitech's λ Knowledge Unit                         #
#                       Made by: David GIRON                                   #
#                                                                              #
################################################################################


NAME = step1

ML =	gate.ml		\
	case.ml		\
	maze.ml		\
	step1.ml	\

MLI =	gate.mli	\
	case.mli	\
	maze.mli


CMI = $(MLI:.mli=.cmi)
CMO = $(ML:.ml=.cmo)
CMX = $(ML:.ml=.cmx)

OCAMLDPE = ocamldep
CAMLFLAGS = -w Aelz -warn-error A
OCAMLC = ocamlc $(CAMLFLAGS)
OCAMLOPT = ocamlopt $(CAMLFLAGS)

all:		$(CMI) $(NAME)

byte:		$(CMI) $(NAME).byte


$(NAME):	$(CMX)
		@$(OCAMLOPT) -o $@ $(CMX)

$(NAME).byte:	$(CMO)
		@$(OCAMLC) -o $@ $(CMO)

%.cmx:		%.ml
		@$(OCAMLOPT) -c $<

%.cmo:		%.ml
		@$(OCAMLC) -c $<

%.cmi:		%.mli
		@$(OCAMLC) -c $<

clean:
		@/bin/rm -f *.cm* *.o *~

fclean: 	clean
		@/bin/rm -f $(NAME) $(NAME).byte

re:		fclean all

################################################################################
