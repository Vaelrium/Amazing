
open Sdlevent
open Sdlkey
open Sdlvideo

let image_src = "background.jpg"
let win_x = 1200
let win_y = 800
let side = 10
let sq_size = 40
let seps = 10
let board_side = side * sq_size + ((seps) * side)
(* let o_x = (win_x - board_side) / 2 *)
(* let o_y = (win_y - board_side) / 2 *)
let o_x = win_x/2 - board_side/2
let o_y = win_y/2 - board_side/2
(* let f_x = o_x + board_side *)
(* let f_y = o_y + board_side *)
let a = sq_size + seps

let rec draw_row x y screen = match x with
    | x when x = (o_x + side * a) -> ()
    | _-> let square =Sdlvideo.create_RGB_surface [`HWSURFACE] sq_size sq_size 32 (Int32.of_int 0xFF000000) (Int32.of_int 0x00FF0000) (Int32.of_int 0x0000FF00) (Int32.of_int 0) in
	  let square_pos = Sdlvideo.rect (x + a) (y) (x + sq_size) (y + sq_size) in
	  (*Sdlvideo.fill_rect ~rect:square_pos square (Int32.of_int 4294967295);*)
	  (* Printf.printf "blitting square at (%d, %d)\n" (x + a) (y + a); *)
	  Sdlvideo.blit_surface ~dst_rect:square_pos ~src:square ~dst:screen ();
	  (* Sdlvideo.update_rect ~rect:square_pos screen ; *)
	  draw_row (x + a) y screen

let rec draw_maze x y screen = match y with
    |  y when y = (o_y + side * a) -> ()
    | _ -> draw_row x y screen;
	   draw_maze x (y + a) screen

let rec event_handler () = match wait_event () with
    | KEYDOWN {keysym=KEY_ESCAPE} -> ()
    | event -> event_handler ()

let main () =
    Sdl.init [`VIDEO];
    at_exit Sdl.quit;
    let screen = Sdlvideo.set_video_mode win_x win_y [] in
    let bg = Sdlloader.load_image image_src in
    let pos_bg = Sdlvideo.rect 0 0 win_x win_y in
    Sdlvideo.blit_surface ~dst_rect:pos_bg ~src:bg ~dst:screen ();
    Printf.printf "board side = %d, o_x = %d, o_y = %d, a = %d, max value x = %d, max value y = %d\n" board_side o_x o_y a (o_x + side * a) (o_y + side * a);
    draw_maze o_x o_y screen ;
    (* Sdlvideo.flip screen;*)
    event_handler ()

let _ = main ()
