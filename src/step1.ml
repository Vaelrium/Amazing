let arglist = Array.to_list Sys.argv;;

if List.length arglist != 3
then (print_endline("invalid argument number") ; exit 0) ;;

if List.nth arglist 1 = List.nth arglist 2
then print_endline("yéé carré")
else (print_endline("invalid arguments") ; exit 0) ;;

let maze = Maze.Maze.create_maze 10;;

Maze.Maze.desc_maze maze;;

let cases = Maze.Maze.get_maze maze;;

if (Case.Case.get_x cases.(1).(5)) = 5 then Printf.printf "ESCALOPE\n";;

Random.self_init();;

let butthole = Random.int 100;;
print_int butthole;;
