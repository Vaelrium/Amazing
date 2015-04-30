let arglist = Array.to_list Sys.argv;;

if List.length arglist != 3
then (print_endline("invalid argument number") ; exit 0) ;;

if List.nth arglist 1 = List.nth arglist 2
then print_endline("yéé carré")
else (print_endline("invalid arguments") ; exit 0) ;;

let maze = Maze.Maze.create_maze (int_of_string (List.nth arglist 2));;

Maze.Maze.desc_maze maze;;



Random.self_init();;

if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n";;

(* Maze.Maze.make_perfect maze 0;; *)

Maze.Maze.aff_maze maze 0;;

if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n"
