
/atom/movable/screen/blob
	icon = 'icons/mob/blob.dmi'

/atom/movable/screen/blob/MouseEntered(location,control,params)
	openToolTip(usr,src,params,title = name,content = desc, theme = "blob")

/atom/movable/screen/blob/MouseExited()
	closeToolTip(usr)

/atom/movable/screen/blob/blob_help
	icon_state = "ui_help"
	name = "Blob Help"
	desc = "Help on playing blob!"

/atom/movable/screen/blob/blob_help/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.blob_help()

/atom/movable/screen/blob/jump_to_node
	icon_state = "ui_tonode"
	name = "Jump to Node"
	desc = "Moves your camera to a selected blob node."

/atom/movable/screen/blob/jump_to_node/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.jump_to_node()

/atom/movable/screen/blob/jump_to_core
	icon_state = "ui_tocore"
	name = "Jump to Core"
	desc = "Moves your camera to your blob core."

/atom/movable/screen/blob/jump_to_core/MouseEntered(location,control,params)
	if(hud && hud.mymob && isovermind(hud.mymob))
		var/mob/camera/blob/B = hud.mymob
		if(!B.placed)
			name = "Place Blob Core"
			desc = "Attempt to place your blob core at this location."
		else
			name = initial(name)
			desc = initial(desc)
	..()

/atom/movable/screen/blob/jump_to_core/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		if(!B.placed)
			B.place_blob_core(0)
		B.transport_core()

/atom/movable/screen/blob/blobbernaut
	icon_state = "ui_blobbernaut"
	name = "Produce Blobbernaut (40)"
	desc = "Produces a strong, smart blobbernaut from a factory blob for 40 resources.<br>The factory blob used will become fragile and unable to produce spores."

/atom/movable/screen/blob/blobbernaut/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.create_blobbernaut()

/atom/movable/screen/blob/resource_blob
	icon_state = "ui_resource"
	name = "Produce Resource Blob (40)"
	desc = "Produces a resource blob for 40 resources.<br>Resource blobs will give you resources every few seconds."

/atom/movable/screen/blob/resource_blob/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.create_resource()

/atom/movable/screen/blob/node_blob
	icon_state = "ui_node"
	name = "Produce Node Blob (50)"
	desc = "Produces a node blob for 50 resources.<br>Node blobs will expand and activate nearby resource and factory blobs."

/atom/movable/screen/blob/node_blob/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.create_node()

/atom/movable/screen/blob/factory_blob
	icon_state = "ui_factory"
	name = "Produce Factory Blob (60)"
	desc = "Produces a factory blob for 60 resources.<br>Factory blobs will produce spores every few seconds."

/atom/movable/screen/blob/factory_blob/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.create_factory()

/atom/movable/screen/blob/readapt_strain
	icon_state = "ui_chemswap"
	name = "Readapt Strain (40)"
	desc = "Allows you to choose a new strain from 4 random choices for 40 resources."

/atom/movable/screen/blob/readapt_strain/MouseEntered(location,control,params)
	if(hud && hud.mymob && isovermind(hud.mymob))
		var/mob/camera/blob/B = hud.mymob
		if(B.free_strain_rerolls)
			name = "Readapt Strain (FREE)"
			desc = "Randomly rerolls your strain for free."
		else
			name = initial(name)
			desc = initial(desc)
	..()

/atom/movable/screen/blob/readapt_strain/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.strain_reroll()

/atom/movable/screen/blob/relocate_core
	icon_state = "ui_swap"
	name = "Relocate Core (80)"
	desc = "Swaps a node and your core for 80 resources."

/atom/movable/screen/blob/relocate_core/Click()
	if(isovermind(usr))
		var/mob/camera/blob/B = usr
		B.relocate_core()

/datum/hud/blob_overmind/New(mob/owner)
	..()
	var/atom/movable/screen/using

	blobpwrdisplay = new /atom/movable/screen()
	blobpwrdisplay.name = "blob power"
	blobpwrdisplay.icon_state = "block"
	blobpwrdisplay.screen_loc = ui_health
	blobpwrdisplay.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	blobpwrdisplay.plane = ABOVE_HUD_PLANE
	blobpwrdisplay.hud = src
	infodisplay += blobpwrdisplay

	healths = new /atom/movable/screen/healths/blob()
	healths.hud = src
	infodisplay += healths

	using = new /atom/movable/screen/blob/blob_help()
	using.screen_loc = "WEST:6,NORTH:-3"
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/jump_to_node()
	using.screen_loc = ui_inventory
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/jump_to_core()
	using.screen_loc = ui_zonesel
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/blobbernaut()
	using.screen_loc = ui_belt
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/resource_blob()
	using.screen_loc = ui_back
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/node_blob()
	using.screen_loc = ui_hand_position(2)
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/factory_blob()
	using.screen_loc = ui_hand_position(1)
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/readapt_strain()
	using.screen_loc = ui_storage1
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/blob/relocate_core()
	using.screen_loc = ui_storage2
	using.hud = src
	static_inventory += using
