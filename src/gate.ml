
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

    type t = {mutable l : bool; mutable u : bool; mutable r : bool; mutable d : bool }

    let create_door = {l = false; u = false; r = false; d = false}
    let new_door newl newu newr newd = {l = newl; u = newu; r = newr; d = newd}
    let left t = t.l
    let up t = t.u
    let right t = t.r
    let down t = t.d

  end
