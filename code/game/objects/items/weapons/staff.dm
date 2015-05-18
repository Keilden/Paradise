/obj/item/weapon/twohanded/staff
	name = "wizards staff"
	desc = "Apparently a staff used by the wizard."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staff"
	force = 3.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	w_class = 2.0
	flags = NOSHIELD
	attack_verb = list("bludgeoned", "whacked", "disciplined")

/obj/item/weapon/twohanded/staff/broom
	name = "broom"
	desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"
	item_state = "broom0"
	icon_override = 'icons/mob/in-hand/staff.dmi'

/obj/item/weapon/twohanded/staff/broom/attack_self(mob/user as mob)
	..()
	item_state = "broom[wielded ? 1 : 0]"
	force = wielded ? 5 : 3
	attack_verb = wielded ? list("rammed into", "charged at") : list("bludgeoned", "whacked", "cleaned")
	if(user)
		user.update_inv_l_hand()
		user.update_inv_r_hand()
		if(user.mind in ticker.mode.wizards)
			user.flying = wielded ? 1 : 0
			if(wielded)
				user << "<span class='notice'>You hold \the [src] between your legs.</span>"
				user.say("QUID 'ITCH")
				animate(user, pixel_y = pixel_y + 10 , time = 10, loop = 1, easing = SINE_EASING)
			else
				animate(user, pixel_y = pixel_y + 10 , time = 1, loop = 1)
				animate(user, pixel_y = pixel_y, time = 10, loop = 1, easing = SINE_EASING)
				animate(user)
				if(user.lying)//aka. if they have just been stunned
					user.pixel_y -= 6
		else
			if(wielded)
				user << "<span class='notice'>You hold \the [src] between your legs.</span>"

/obj/item/weapon/twohanded/staff/broom/attackby(var/obj/O, mob/user)
	if(istype(O, /obj/item/clothing/mask/horsehead))
		new/obj/item/weapon/twohanded/staff/broom/horsebroom(get_turf(src))
		user.unEquip(O)
		qdel(O)
		qdel(src)
		return
	..()

/obj/item/weapon/twohanded/staff/broom/horsebroom
	name = "broomstick horse"
	desc = "Saddle up!"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "horsebroom"
	item_state = "horsebroom0"
	icon_override = 'icons/mob/in-hand/staff.dmi'

/obj/item/weapon/twohanded/staff/broom/horsebroom/attack_self(mob/user as mob)
	..()
	item_state = "horsebroom[wielded ? 1 : 0]"

/obj/item/weapon/twohanded/staff/stick
	name = "stick"
	desc = "A great tool to drag someone else's drinks across the bar."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stick"
	item_state = "stick"
	force = 3.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	w_class = 2.0
	flags = NOSHIELD