


module type MAZE =
  sig

      type v

      val create_maze : int -> v
      val get_x : v -> int
      val get_maze : v -> Case.Case.u array array
      val desc_maze : v -> unit
      val desc_row : Case.Case.u array -> unit
      val check_perfect : v -> bool
      val check_row : int -> Case.Case.u array -> int -> bool

      val find_random : v -> (Case.Case.u * Case.Case.u * int)
      val check_joined : Case.Case.u -> Case.Case.u -> int -> bool
      val check_diff : Case.Case.u -> Case.Case.u -> bool
      val uniformiz_idz : v -> Case.Case.u -> int -> unit
      val one_join : v -> unit
      val make_perfect : v -> int -> unit (* int de test *)

      val aff_x_und : int -> int -> unit
      val joined_down : v -> int -> int -> bool
      val joined_right : v -> int -> int -> bool
      val aff_line : v -> int -> int -> unit
      val aff_maze : v -> int -> unit
  end

module	Maze : MAZE =
  struct

    type v = (int * Case.Case.u array array)
    let create_maze x = (x, Array.init x ( fun idy -> Array.init x (fun idx -> Case.Case.create_case idx idy (idx + idy * x))))
    let get_x(x, maze) = x
    let get_maze(x, maze) = maze
    let desc_row row =
      let rec helper row ctr = match ctr with
   	    ctr when ctr = Array.length row -> ()
   	  | _ -> Case.Case.desc (row.(ctr)); helper row (ctr+1)
      in helper row 0;;
    let desc_maze (x, maze) = Array.iter (desc_row) maze
    let rec check_row first_id row ctr =
     if ctr == Array.length row then true
     else if (Case.Case.get_id row.(ctr)) != first_id then false
     else check_row first_id row (ctr+1)
    let check_perfect(x, maze) =
      let first_id = Case.Case.get_id maze.(0).(0) in
      let rec my_iter cases ctr max =
	if ctr = max then true
	else if check_row first_id cases.(ctr) 0 then my_iter cases (ctr+1) max
	else false
      in my_iter maze 0 x;;


    let rec aff_x_und x ctr =
      if ctr = x then (print_endline "."; ())
      else (print_string "._"; aff_x_und x (ctr+1))
    let joined_down (x, maze) vy vx =
      let doors1 = Case.Case.get_doors maze.(vy).(vx) in
      let doors2 = Case.Case.get_doors maze.(vy+1).(vx) in
      if Gate.Gate.down doors1 && Gate.Gate.up doors2 then true
      else false
    let joined_right (x, maze) vy vx =
      let doors1 = Case.Case.get_doors maze.(vy).(vx) in
      let doors2 = Case.Case.get_doors maze.(vy).(vx+1) in
      if Gate.Gate.right doors1 && Gate.Gate.left doors2 then true
      else false
    let rec aff_line (x, maze) y ctr =
      if ctr = 0 then print_string "|";
      if y != (x -1) then (if (joined_down (x, maze) y ctr) = false then print_string "_" else print_string " ")
      else print_string "_";
      if ctr != (x - 1) then (if (joined_right (x, maze) y ctr) = false then print_string "|" else print_string ".")
      else (print_endline "|");
      if ctr != (x-1) then aff_line (x, maze) y (ctr+1)
    let rec aff_maze (x, maze) ctr =
      if ctr = 0 then (aff_x_und x 0);
      if ctr = x then ()
      else (aff_line (x, maze) ctr 0;
	    aff_maze (x, maze) (ctr+1))


    let check_joined one two pos =
      let d1 = Case.Case.get_doors one in
      let d2 = Case.Case.get_doors two in
      if pos == 0 && Gate.Gate.right d1 && Gate.Gate.left d2 then true
      else if pos == 1 && Gate.Gate.left d1 && Gate.Gate.right d2 then true
      else if pos == 2 && Gate.Gate.up d1 && Gate.Gate.down d2 then true
      else if pos == 3 && Gate.Gate.down d1 && Gate.Gate.up d2 then true
      else false

    let check_diff one two =
      if Case.Case.get_id one != Case.Case.get_id two then true
      else false

    let rec uniformiz_idz (x, cases) to_change id =
      Case.Case.set_id to_change id;
      let vx = Case.Case.get_x to_change in
      let vy = Case.Case.get_y to_change in
      if (vx + 1) < (x-1) then (if (check_diff to_change cases.(vy).(vx+1)) && (check_joined to_change cases.(vy).(vx+1) 0) then uniformiz_idz (x, cases) cases.(vy).(vx+1) id);
      if (vx - 1) >= 0 then (if (check_diff to_change cases.(vy).(vx-1)) && (check_joined to_change cases.(vy).(vx-1) 1) then uniformiz_idz (x, cases) cases.(vy).(vx-1) id);
      if (vy + 1) < (x-1) then (if (check_diff to_change cases.(vy+1).(vx)) && (check_joined to_change cases.(vy+1).(vx) 2) then uniformiz_idz (x, cases) cases.(vy+1).(vx) id);
      if (vy - 1) >= 0 then (if (check_diff to_change cases.(vy-1).(vx)) && (check_joined to_change cases.(vy-1).(vx) 3) then uniformiz_idz (x, cases) cases.(vy-1).(vx) id)


    let rec find_random (x, cases) =
      let dir = Random.int 4 in
      let vx = Random.int x in
      let vy = Random.int x in
      let first = cases.(vx).(vy) in
      if dir = 0 && (vx + 1) < (x-1) && Case.Case.get_id first != Case.Case.get_id cases.(vy).(vx + 1) then (first, cases.(vy).(vx + 1), 0)
      else if dir = 1 && (vx - 1) >= 0 && Case.Case.get_id first != Case.Case.get_id cases.(vy).(vx - 1) then (first, cases.(vy).(vx - 1), 1)
      else if dir = 2 && (vy + 1) < (x-1) && Case.Case.get_id first != Case.Case.get_id cases.(vy + 1).(vx) then (first, cases.(vy + 1).(vx), 2)
      else if dir = 3 && (vy - 1) >= 0 && Case.Case.get_id first != Case.Case.get_id cases.(vy - 1).(vx) then (first, cases.(vy - 1).(vx), 3)
      else find_random (x, cases)

    let one_join (x, cases) =
      let (first, second, dir) = find_random (x, cases) in
      let doors1 = Case.Case.get_doors first in
      let doors2 = Case.Case.get_doors second in
      if dir == 0 then (Gate.Gate.sr doors1; Gate.Gate.sl doors2)
      else if dir == 1 then (Gate.Gate.sl doors1; Gate.Gate.sr doors2)
      else if dir == 2 then (Gate.Gate.su doors1; Gate.Gate.sd doors2)
      else (Gate.Gate.sd doors1; Gate.Gate.su doors2);
      uniformiz_idz (x, cases) second (Case.Case.get_id first)

    let rec make_perfect (x, maze) ctr = (* delete ctr *)
      aff_maze (x, maze) 0;
      if check_perfect (x, maze) || ctr = 4 then ()
      else (one_join (x, maze); make_perfect (x, maze) (ctr+1))


  end
