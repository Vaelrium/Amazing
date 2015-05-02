
let main () =
  let arglist = Array.to_list Sys.argv in
  if List.length arglist != 3 then (print_endline("Usage : ./step1 <x> <x> (x being the positive width of the maze)") ; exit 0) ;
  let x = int_of_string (List.nth arglist 1) in
  let y = int_of_string (List.nth arglist 2) in
  if x <> y || x < 1 then (print_endline("Usage : ./step1 <x> <x> (x being the positive width of the maze)") ; exit 0) ;
  let maze = Maze.Maze.create_maze x in
  Random.self_init();
  Maze.Maze.make_perfect maze;
  Maze.Maze.aff_maze maze 0

let _ = main ()
