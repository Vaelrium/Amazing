module type MAZE =
  sig

      type v

      val create_maze : int -> v
     (* val make_perfect : v -> v*)
      val get_x : v -> int
      val get_maze : v -> Case.Case.u array array
      val desc_maze : v -> unit
      val desc_row : Case.Case.u array -> unit
      val check_perfect : v -> bool
      val check_row : int -> Case.Case.u array -> int -> bool
end

module Maze : MAZE
