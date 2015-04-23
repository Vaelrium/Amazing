##
## Makefile for JEFFF in /home/ganesha/projets/Amazing
##
## Made by Ambroise Coutarel
## Login   <ganesha@epitech.net>
##
## Started on  Mon Apr 13 12:40:51 2015 Ambroise Coutarel
## Last update Thu Apr 23 13:04:36 2015 Rémi DURAND
##

SRC1	=	./src/step1.ml		\
		./src/gate.ml

SRC2	=	./src/step2.ml

SRC3	=	./src/step3.ml

SRC4	=	./src/step4.ml

SRC5	=	./src/step5.ml

STEP1	=	step1

STEP2	=	step2

STEP3	=	step3

STEP4	=	step4

STEP5	=	step5

RM	=	rm -f

OCAML	=	ocamlopt

all:	step1 step2 step3 step4 step5

step1:
	$(OCAML) -o $(STEP1) $(SRC1)

step2:
	$(OCAML) -o $(STEP2) $(SRC2)

step3:
	$(OCAML) -o $(STEP3) $(SRC3)

step4:
	$(OCAML) -o $(STEP4) $(SRC4)

step5:
	$(OCAML) -o $(STEP5) $(SRC5)

clean:
	$(RM) ./src/*.o ./src/*.cmx ./src/*.cmi

fclean: clean
	$(RM) $(STEP1) $(STEP2) $(STEP3) $(STEP4) $(STEP5)

re: fclean all
