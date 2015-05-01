
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

module	Gate : GATE =
  struct

    type t = {l : bool ref; u : bool ref; r : bool ref; d : bool ref }

    let create_door = {l = ref false; u = ref false; r = ref false; d = ref false}
    let new_door newl newu newr newd = {l = ref newl; u = ref newu; r = ref newr; d = ref newd}
    let left t = !(t.l)
    let up t = !(t.u)
    let right t = !(t.r)
    let down t = !(t.d)

    let sl t = t.l := true
    let sr t = t.r := true
    let su t = t.u := true
    let sd t = t.d := true
    
    (* type t = {mutable l : bool; mutable u : bool; mutable r : bool; mutable d : bool } *)

    (* let create_door = {l = false; u = false; r = false; d = false} *)
    (* let new_door newl newu newr newd = {l = newl; u = newu; r = newr; d = newd} *)
    (* let left t = t.l *)
    (* let up t = t.u *)
    (* let right t = t.r *)
    (* let down t = t.d *)

    (* let sl t = let a = ref t.l in a := true *)
    (* let sr t = let a = ref t.r in a := true *)
    (* let su t = let a = ref t.u in a := true *)
    (* let sd t = let a = ref t.d in a := true *)
    (* let sl t = t.l <- true *)
    (* let sr t = t.r <- true *)
    (* let su t = t.u <- true *)
    (* let sd t = t.d <- true *)
  end
