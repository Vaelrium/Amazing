


module type MAZE =
  sig

      type v

      val create_maze : int -> v
      (*val make_perfect : v -> v
      val check_perfect : v -> bool*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u array array
      val desc_maze : v -> unit
      val desc_row : Case.Case.u array -> unit

  end

module	Maze : MAZE =
  struct

    type v = (int * Case.Case.u array array)
    let create_maze x = (x, Array.init x ( fun idy -> Array.init x (fun idx -> Case.Case.create_case idx idy (idx + idy* 10))))
   (*       let make_perfect (x, maze) = véritable génération du laby *)
   (* let check_perfect(x, maze) =  vérifie validité laby *)
    let get_x(x, maze) = x
    let get_maze(x, maze) = maze
    let desc_row row =
      let rec helper row ctr = match ctr with
   	    ctr when ctr = Array.length row -> ()
   	  | _ -> Case.Case.desc (row.(ctr)); helper row (ctr+1)
      in helper row 0;;
   let desc_maze (x, maze) = Array.iter (desc_row) maze
  end

