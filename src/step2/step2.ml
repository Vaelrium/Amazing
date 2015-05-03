

open Sdlevent
open Sdlkey
open Sdlvideo

let image_src = "background.jpg"
let win_x = 1200
let win_y = 800
let sq_size = 20
let seps = 5
let a = sq_size + seps

let draw_square x y w h screen =
  let square = Sdlvideo.create_RGB_surface [`HWSURFACE] w h 32 (Int32.of_int 0xFF000000) (Int32.of_int 0x00FF0000) (Int32.of_int 0x0000FF00) (Int32.of_int 0) in
  let square_pos = Sdlvideo.rect x y w h in
  Sdlvideo.blit_surface ~dst_rect:square_pos ~src:square ~dst:screen ()

let door_rects l u r d x y screen =
  if l == true then draw_square (x - seps) y seps sq_size screen ;
  if u == true then draw_square x (y - seps) sq_size seps screen ;
  if r == true then draw_square (x + sq_size) y seps sq_size screen ;
  if d == true then draw_square x (y + sq_size) sq_size seps screen

let draw_doors x y doorset screen =
  let l = Gate.Gate.left doorset in
  let r = Gate.Gate.right doorset in
  let u = Gate.Gate.up doorset in
  let d = Gate.Gate.down doorset in
  door_rects l u r d x y screen

let rec draw_row x y o_x o_y side screen grid_x grid_y maze_grid = match x with
    | x when x = (o_x + side * a) -> ()
    | _-> let square =Sdlvideo.create_RGB_surface [`HWSURFACE] sq_size sq_size 32 (Int32.of_int 0xFF000000) (Int32.of_int 0x00FF0000) (Int32.of_int 0x0000FF00) (Int32.of_int 0) in
	  let square_pos = Sdlvideo.rect (x + a) (y) (x + sq_size) (y + sq_size) in
	  Sdlvideo.blit_surface ~dst_rect:square_pos ~src:square ~dst:screen ();
	  let doorset = Case.Case.get_doors maze_grid.(grid_y).(grid_x) in
	  draw_doors (x + a) y doorset screen ;
	  draw_row (x + a) y o_x o_y side screen (grid_x + 1) grid_y maze_grid

let rec draw_maze x y o_x o_y side screen grid_x grid_y maze_grid = match y with
    |  y when y = (o_y + side * a) -> ()
    | _ -> draw_row x y o_x o_y side screen grid_x grid_y maze_grid ;
	   draw_maze x (y + a) o_x o_y side screen grid_x (grid_y + 1) maze_grid

let rec event_handler () = match wait_event () with
    | KEYDOWN {keysym=KEY_ESCAPE} -> ()
    | event -> event_handler ()

let sdl_diplay maze =
  Sdl.init [`VIDEO];
  at_exit Sdl.quit;
  let screen = Sdlvideo.set_video_mode win_x win_y [] in
  let bg = Sdlloader.load_image image_src in
  let pos_bg = Sdlvideo.rect 0 0 win_x win_y in
  Sdlvideo.blit_surface ~dst_rect:pos_bg ~src:bg ~dst:screen ();
  let side = Maze.Maze.get_x maze in
  let maze_grid = Maze.Maze.get_maze maze in
  let board_side = side * sq_size + ((seps) * side) in
  let o_x = win_x/2 - board_side/2 in
  let o_y = win_y/2 - board_side/2 in
  draw_maze o_x o_y o_x o_y side screen 0 0 maze_grid;
  Sdlvideo.flip screen;
  event_handler ()

let main () =
  let arglist = Array.to_list Sys.argv in
  if List.length arglist != 3 then (print_endline("invalid argument number") ; exit 0) ;
  let x = int_of_string (List.nth arglist 1) in
  let y = int_of_string (List.nth arglist 2) in
  if x <> y || x < 1 then (print_endline("invalid arguments") ; exit 0) ;
  let maze = Maze.Maze.create_maze x in
  Random.self_init() ;
  Maze.Maze.make_perfect maze;
  sdl_diplay maze


let _ = main ()
