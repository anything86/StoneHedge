/datum/job/roguetown/archivist
	title = "Archivist"
	tutorial = " The Archivist meticulously preserves and organizes ancient scrolls and tomes, safeguarding the collective knowledge of the realm for generations to come. Nobles and Peasants alike often seek the Archivists of the Academy for Magical Scrolls and Expertise.."
	flag = ARCHIVIST
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	spells = list(/obj/effect/proc_holder/spell/invoked/projectile/fetch, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = ALL_AGES_LIST

	outfit = /datum/outfit/job/roguetown/archivist
	display_order = JDO_ARCHIVIST
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/archivist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		switch(H.patron?.type)
			if(/datum/patron/divine/eora) //Eoran loadouts
				shoes = /obj/item/clothing/shoes/roguetown/sandals
				shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/purple
				pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/black
				head  = /obj/item/clothing/head/peaceflower
			else
				shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/black
				pants = /obj/item/clothing/under/roguetown/tights/stockings/black
				head  = /obj/item/clothing/head/roguetown/roguehood/black
				shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		pants = /obj/item/clothing/under/roguetown/tights/black
		head = /obj/item/clothing/head/roguetown/nightman
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	H.virginity = TRUE
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/storage/keyring/mage
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	mask = /obj/item/clothing/mask/rogue/spectacles
	id = /obj/item/clothing/ring/keystone
	ADD_TRAIT(H, TRAIT_MAGICLEARN, TRAIT_GENERIC)

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE) //this shit may rival the academy with that intelligence already.
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("strength", -2)
		H.change_stat("intelligence", 8)
		H.change_stat("constitution", -2)
		H.change_stat("speed", -2)
