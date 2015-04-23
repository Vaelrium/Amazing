module type MAZE =
  sig

      type v

      val create_maze : int -> v
     (* val make_perfect : v -> v
      val check_perfect : v -> bool*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u list
  end

module Maze : MAZE
