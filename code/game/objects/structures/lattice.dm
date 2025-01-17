/obj/structure/lattice
	name = "lattice"
	desc = "A lightweight support lattice. These hold our station together."
	icon = 'icons/obj/smooth_structures/lattice.dmi'
	icon_state = "lattice"
	density = FALSE
	anchored = TRUE
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50)
	max_integrity = 50
	layer = LATTICE_LAYER //under pipes
	plane = FLOOR_PLANE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN
	smoothing_flags = SMOOTH_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_LATTICE)
	canSmoothWith = list(SMOOTH_GROUP_LATTICE, SMOOTH_GROUP_OPEN_FLOOR, SMOOTH_GROUP_WALLS)
	var/number_of_mats = 1
	var/build_material = /obj/item/stack/rods


/obj/structure/lattice/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/lattice/proc/deconstruction_hints(mob/user)
	return "<span class='notice'>The rods look like they could be <b>cut</b>. There's space for more <i>rods</i> or a <i>tile</i>.</span>"

/obj/structure/lattice/Initialize(mapload)
	. = ..()
	for(var/obj/structure/lattice/LAT in loc)
		if(LAT == src)
			continue
		stack_trace("multiple lattices found in ([loc.x], [loc.y], [loc.z])")
		return INITIALIZE_HINT_QDEL

/obj/structure/lattice/blob_act(obj/structure/blob/B)
	return

/obj/structure/lattice/attackby(obj/item/C, mob/user, params)
	if(resistance_flags & INDESTRUCTIBLE)
		return
	if(C.tool_behaviour == TOOL_WIRECUTTER)
		to_chat(user, "<span class='notice'>Slicing [name] joints ...</span>")
		deconstruct()
	else
		var/turf/T = get_turf(src)
		return T.attackby(C, user) //hand this off to the turf instead (for building plating, catwalks, etc)

/obj/structure/lattice/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new build_material(get_turf(src), number_of_mats)
	qdel(src)

/obj/structure/lattice/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	if(the_rcd.mode == RCD_FLOORWALL)
		return list("mode" = RCD_FLOORWALL, "delay" = 0, "cost" = 2)

/obj/structure/lattice/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	if(passed_mode == RCD_FLOORWALL)
		to_chat(user, "<span class='notice'>You build a floor.</span>")
		var/turf/T = src.loc
		if(isspaceturf(T))
			T.PlaceOnTop(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
			qdel(src)
			return TRUE
	return FALSE

/obj/structure/lattice/singularity_pull(S, current_size)
	if(current_size >= STAGE_FOUR)
		deconstruct()

/obj/structure/lattice/catwalk
	name = "catwalk"
	desc = "A catwalk for easier EVA maneuvering and cable placement."
	icon = 'icons/obj/smooth_structures/catwalk.dmi'
	icon_state = "catwalk"
	number_of_mats = 2
	smoothing_flags = SMOOTH_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_LATTICE, SMOOTH_GROUP_OPEN_FLOOR)
	canSmoothWith = null
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN | BLOCK_Z_IN_UP

/obj/structure/lattice/catwalk/deconstruction_hints(mob/user)
	return "<span class='notice'>The supporting rods look like they could be <b>cut</b>.</span>"

/obj/structure/lattice/catwalk/proc/cablecheck()
	var/turf/T = loc
	for(var/obj/structure/cable/C in T && layer >> WIRE_TERMINAL_LAYER)
		C.deconstruct()

/obj/structure/lattice/catwalk/Move()
	cablecheck()
	..()

/obj/structure/lattice/catwalk/deconstruct()
	cablecheck()
	..()

/// A variant of catwalks placed over plating.
/obj/structure/lattice/catwalk/over
	layer = LOW_OBJ_LAYER
	plane = GAME_PLANE

/obj/structure/lattice/catwalk/over/plated
	icon = 'icons/obj/catwalk.dmi'
	icon_state = "plated_maint"
	smoothing_flags = NONE
	smoothing_groups = null
	canSmoothWith = null

/obj/structure/lattice/catwalk/over/plated/plasteel
	icon_state = "plated"

/obj/structure/lattice/catwalk/over/plated/plasteel/dark
	icon_state = "plated_dark"

/obj/structure/lattice/catwalk/over/plated/plasteel/white
	icon_state = "plated_white"

/obj/structure/lattice/catwalk/over/plated/plasteel/mil
	icon_state = "plated_tgmc"

/obj/structure/lattice/lava
	name = "heatproof support lattice"
	desc = "A specialized support beam for building across lava and flammable operating environments. Watch your step."
	icon = 'icons/obj/smooth_structures/catwalk.dmi'
	icon_state = "catwalk"
	number_of_mats = 1
	color = "#5286b9ff"
	resistance_flags = FIRE_PROOF | LAVA_PROOF

/obj/structure/lattice/lava/deconstruction_hints(mob/user)
	return "<span class='notice'>The rods look like they could be <b>cut</b>, but the <i>heat treatment will shatter off</i>. There's space for a <i>tile</i>.</span>"

/obj/structure/lattice/lava/attackby(obj/item/C, mob/user, params)
	. = ..()
	if(istype(C, /obj/item/stack/tile/iron))
		var/obj/item/stack/tile/iron/P = C
		if(P.use(1))
			to_chat(user, "<span class='notice'>You construct a floor plating, as lava settles around the rods.</span>")
			playsound(src, 'sound/weapons/genhit.ogg', 50, TRUE)
			new /turf/open/floor/plating(locate(x, y, z))
		else
			to_chat(user, "<span class='warning'>You need one floor tile to build atop [src].</span>")
		return
