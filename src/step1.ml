
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
  Maze.Maze.aff_maze maze 0;
     (* let cases = Maze.Maze.get_maze maze in
    let door = Case.Case.get_doors cases.(0).(0) in
    let door2 = Case.Case.get_doors cases.(0).(1) in
Gate.Gate.sr door;
Gate.Gate.sl door2;
    Maze.Maze.aff_maze maze 0;

      print_string "------------------\n";;*)
  (* Maze.Maze.make_perfect maze 0; *)
  let laby = Maze.Maze.get_maze maze in
  let test = Case.Case.get_doors laby.(0).(0) in
  if Gate.Gate.right test == false 
  then print_endline "right gate (0,0) is false";
  Gate.Gate.sr test;
  if Gate.Gate.right test == false 
  then print_endline "right gate (0,0) is false" 
  else print_endline "right gate (0,0) is true";
  let test2 = Case.Case.get_doors laby.(0).(1) in
  Gate.Gate.sl test2;
  if Gate.Gate.left test2 == false 
  then print_endline "left gate (0,1) is false" 
  else print_endline "leftt gate (0,1) is true";
  Maze.Maze.aff_maze maze 0;

if Maze.Maze.check_perfect maze then print_endline "\nOUI !\n" else print_endline "\nNON :(\n"


let _ = main ()
