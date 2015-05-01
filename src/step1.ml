
let main () = 
  let arglist = Array.to_list Sys.argv in
  if List.length arglist != 3 then (print_endline("invalid argument number") ; exit 0) ;
  let x = int_of_string (List.nth arglist 1) in
  let y = int_of_string (List.nth arglist 2) in
  if x <> y || x < 1 then (print_endline("invalid arguments") ; exit 0) ;
  let maze = Maze.Maze.create_maze x in
  Maze.Maze.desc_maze maze ;
  Random.self_init() ;
  if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n" ;
  Maze.Maze.aff_maze maze 0

let _ = main ()
