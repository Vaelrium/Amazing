(*type maze = (int * int * Case.case list)*)


module type MAZE =
  sig

      type v

      val create_maze : int -> v
      (*val make_perfect : v -> v
      val check_perfect : v -> bool*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u list

  end

module	Maze : MAZE =
  struct

    type v = (int * Case.Case.u list)

    let create_maze x =
      let rec helper ctr maze max x = match ctr with
	       |  max  -> maze
	       | _ -> let le_mod = ctr mod x;
                let le_div = ctr / x;
                helper (ctr + 1) (Case.Case.create_case (le_mod le_div ctr Gate.Gate.create_door)::maze) max
      in helper 0 [] (x ** 2) x
 (*   let make_perfect (x, maze) = véritable génération du laby *)
  (*  let check_perfect(x, maze) =  vérifie validité laby *)
    let get_x(x, maze) = x
    let get_maze(x, maze) = maze
  
  end

