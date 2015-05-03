type doors	=	(bool * bool * bool * bool)

let create_door l u r d = (l, u, r, d)

let left (l, u, r, d) = l
let up (l, u, r, d) = u
let right (l, u, r, d) = r
let down (l, u, r, d) = d