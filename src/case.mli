module type CASE =
  sig

      type u

      val create_case : int -> int -> int -> Gate.Gate.t -> u
      val get_x : u -> int
      val get_y : u -> int
      val get_id : u -> int
      val get_doors : u -> Gate.Gate.t
  end

module Case : CASE
