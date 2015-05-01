module type GATE =
  sig

      type t

      val create_door : t
      val new_door : bool -> bool -> bool -> bool -> t
      val left : t -> bool
      val up : t -> bool
      val right : t -> bool
      val down : t -> bool
      val sl : t -> unit
      val sr : t -> unit
      val su : t -> unit
      val sd : t -> unit
  end

  module Gate : GATE
