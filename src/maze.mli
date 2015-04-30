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

module Maze : MAZE
