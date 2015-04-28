module type MAZE =
  sig

      type v

      val create_maze : int -> v
     (* val make_perfect : v -> v
      val check_perfect : v -> bool*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u array array
      val desc_maze : v -> unit
      val desc_row : Case.Case.u array -> unit

end

module Maze : MAZE
