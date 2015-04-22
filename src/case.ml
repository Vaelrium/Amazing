(*type case = (int * int * Door.doors)

let create_case x y doorset = (x, y, doorset)

let get_x (x, y, doorset) = x
let get_y (x, y, doorset) = y
let get_doors (x, y, doorset) = doorset*)

module type CASE =
  sig

      type u

      val create_case : int -> int -> int -> Gate.Gate.t -> u
      val get_x : u -> int
      val get_y : u -> int
      val get_id : u -> int
      val get_doors : u -> Gate.Gate.t
  end

module	Case : CASE =
  struct

    type u = (int * int * int * Gate.Gate.t)

    let create_case x y id doorset = (x, y, id, doorset)
    let get_x (x, y, id, doorset) = x
    let get_y (x, y, id, doorset) = y
    let get_id (x, y, id, doorset) = id
    let get_doors (x, y, id, doorset) = doorset

  end
