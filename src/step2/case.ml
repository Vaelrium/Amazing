
module type CASE =
  sig

      type u
      val create_case :  int -> int -> int -> u
      val get_x : u -> int
      val get_y : u -> int
      val get_id : u -> int
      val get_doors : u -> Gate.Gate.t
      val desc : u -> unit
      val set_id : u -> int -> unit
  end

module	Case : CASE =
  struct

    type u = {mutable x : int ; mutable y :int ; mutable id : int; doors : Gate.Gate.t}

    let create_case newx newy newid = {x = newx ; y = newy ; id = newid ; doors = Gate.Gate.new_door false false false false}
    let get_x u = u.x
    let get_y u = u.y
    let get_id u = u.id
    let get_doors u = u.doors
    let desc u = Printf.printf "x = %d, y = %d, id = %d\n" u.x u.y u.id
    let set_id u id = u.id <- id

  end
