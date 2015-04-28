
module type CASE =
  sig

      type u

      (* val create_case : int -> int -> int -> Gate.Gate.t -> u *)
      (* val get_x : u -> int *)
      (* val get_y : u -> int *)
      (* val get_id : u -> int *)
      (* val get_doors : u -> Gate.Gate.t *)
      (* val make_case : int -> int -> int -> u *)
      val create_case :  int -> int -> int -> u
      val get_x : u -> int
      val get_y : u -> int
      val get_id : u -> int
      val get_doors : u -> Gate.Gate.t
      val desc : u -> unit
      (* val make_case : int -> u *)

  end

module	Case : CASE =
  struct

    (* type u = (int * int * int * Gate.Gate.t) *)

    (* let create_case x y id doorset = (x, y, id, doorset) *)
    (* let get_x (x, y, id, doorset) = x *)
    (* let get_y (x, y, id, doorset) = y *)
    (* let get_id (x, y, id, doorset) = id *)
    (* let get_doors (x, y, id, doorset) = doorset *)
    (* let make_case x y id = (x, y, id, Gate.Gate.create_door) *)

    (* type u = (int * Gate.Gate.t) *)

    (* let create_case id doorset = (id, doorset) *)
    (* let get_id (id, doorset) = id *)
    (* let get_doors (id, doorset) = doorset *)
    (* let make_case id = (id, Gate.Gate.create_door) *)

    type u = {mutable x : int ; mutable y :int ; mutable id : int; doors : Gate.Gate.t}

    let create_case newx newy newid = {x = newx ; y = newy ; id = newid ; doors = Gate.Gate.create_door}
    let get_x u = u.x
    let get_y u = u.y
    let get_id u = u.id
    let get_doors u = u.doors
    let desc u = Printf.printf "x = %d, y = %d, id = %d\n" u.x u.y u.id

  end
