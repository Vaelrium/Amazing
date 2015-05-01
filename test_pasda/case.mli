module type CASE =
  sig

      type u

      val create_case : int -> int -> int -> u
      val get_x : u -> int
      val get_y : u -> int
      val get_id : u -> int
      val get_doors : u -> Gate.Gate.t
      val desc : u -> unit
      val set_id : u -> int -> unit
  end

module Case : CASE
