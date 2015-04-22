
module type GATE =
  sig

      type t

      val create_door : t
      val new_door : bool -> bool -> bool -> bool -> t
      val left : t -> bool
      val up : t -> bool
      val right : t -> bool
      val down : t -> bool

  end

module	Gate : GATE =
  struct

    type t = (bool * bool * bool * bool)

    let create_door = (false, false, false, false)
    let new_door l u r d = (l, u, r, d)

    let left (l, u, r, d) = l
    let up (l, u, r, d) = u
    let right (l, u, r, d) = r
    let down (l, u, r, d) = d

  end
