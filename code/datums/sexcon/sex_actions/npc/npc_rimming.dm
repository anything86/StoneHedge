/datum/sex_action/npc_rimming
	name = "NPC Rim them"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_rimming/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_rimming/can_perform(mob/living/user, mob/living/target)
	if(issimple(user))
		return TRUE
	return FALSE

/datum/sex_action/npc_rimming/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts npc_rimming [target]'s butt..."))
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = TRUE

/datum/sex_action/npc_rimming/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rims [target]'s butt..."))
	user.make_sucking_noise()

	target.adjustBruteLoss(-0.2)
	target.adjustFireLoss(-0.2)
	target.adjustOxyLoss(-0.2)
	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/npc_rimming/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops npc_rimming [target]'s butt ..."))
	var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
	usermob.stoppedfucking()
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = FALSE


/datum/sex_action/npc_rimming/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
		usermob.stoppedfucking()
		var/datum/sex_controller/sc = target.sexcon
		sc.beingfucked = FALSE
		return TRUE
	return FALSE