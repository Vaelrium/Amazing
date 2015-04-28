


module type MAZE =
  sig

      type v
      val create_maze : int -> v
      (*val make_perfect : v -> v*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u array array
      val desc_maze : v -> unit
      val desc_row : Case.Case.u array -> unit
      val check_perfect : v -> bool
      val check_row : int -> Case.Case.u array -> int -> bool
  end

module	Maze : MAZE =
  struct

    type v = (int * Case.Case.u array array)
    let create_maze x = (x, Array.init x ( fun idy -> Array.init x (fun idx -> Case.Case.create_case idx idy (idx + idy* 10))))
   (*let make_perfect (x, maze)*)
    let get_x(x, maze) = x
    let get_maze(x, maze) = maze
    let desc_row row =
      let rec helper row ctr = match ctr with
   	    ctr when ctr = Array.length row -> ()
   	  | _ -> Case.Case.desc (row.(ctr)); helper row (ctr+1)
      in helper row 0;;
   let desc_maze (x, maze) = Array.iter (desc_row) maze

   let rec check_row first_id row ctr =
     if (Case.Case.get_id row.(ctr)) != first_id then false;
     if ctr = Array.length row then true;
     helper first_id row (ctr+1)

   (*let check_perfect(x, maze) =
     let first_id = Case.Case.get_id maze.(0).(0) in
     Array.iter check_row first_id maze 0;*)

   let check_perfect(x, maze) =
     let first_id = Case.Case.get_id maze.(0).(0) in
     let rec my_iter cases ctr max =
       if ctr = max + 1 then true;
       if check_row first_id cases.(ctr) 0 then my_iter cases (ctr+1) max else false
     in my_iter maze 0 x;;
  end
