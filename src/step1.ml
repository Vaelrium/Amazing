let arglist = Array.to_list Sys.argv;;

if List.length arglist != 3
then (print_endline("invalid argument number") ; exit 0) ;;

if List.nth arglist 1 = List.nth arglist 2
then print_endline("yéé carré")
else (print_endline("invalid arguments") ; exit 0) ;;

let testgate = Gate.Gate.create_door;;
