let arglist = Array.to_list Sys.argv;;

if List.length arglist != 3
then (print_endline("invalid argument number") ; exit 0) ;;

(*if List.nth arglist 1 = List.nth arglist 2
then print_endline("yéé carré")
else (print_endline("invalid arguments") ; exit 0) ;;*)

let maze = Maze.Maze.create_maze (int_of_string (List.nth arglist 2));;

(*Maze.Maze.desc_maze maze;;*)



Random.self_init();; (* on oubli pas *)

  (*if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n";;*)

(*    Maze.Maze.aff_maze maze 0;;
  let cases = Maze.Maze.get_maze maze;;
    let door = Case.Case.get_doors cases.(0).(0);;
    let door2 = Case.Case.get_doors cases.(0).(1);;
Gate.Gate.sr door;;
Gate.Gate.sl door2;;
    Maze.Maze.aff_maze maze 0;;*)


  Maze.Maze.make_perfect maze;;

    Maze.Maze.aff_maze maze 0;;

if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n"
