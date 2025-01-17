///Called on /mob/living/Initialize(), for the mob to register to relevant signals.
/mob/living/proc/register_init_signals()
	RegisterSignal(src, SIGNAL_ADDTRAIT(TRAIT_KNOCKEDOUT), .proc/on_knockedout_trait_gain)
	RegisterSignal(src, SIGNAL_REMOVETRAIT(TRAIT_KNOCKEDOUT), .proc/on_knockedout_trait_loss)

	RegisterSignal(src, SIGNAL_ADDTRAIT(TRAIT_DEATHCOMA), .proc/on_deathcoma_trait_gain)
	RegisterSignal(src, SIGNAL_REMOVETRAIT(TRAIT_DEATHCOMA), .proc/on_deathcoma_trait_loss)

	RegisterSignal(src, list(
		SIGNAL_ADDTRAIT(TRAIT_CRITICAL_CONDITION),
		SIGNAL_REMOVETRAIT(TRAIT_CRITICAL_CONDITION),

		SIGNAL_ADDTRAIT(TRAIT_NODEATH),
		SIGNAL_REMOVETRAIT(TRAIT_NODEATH),
	), .proc/update_succumb_action)

///Called when TRAIT_KNOCKEDOUT is added to the mob.
/mob/living/proc/on_knockedout_trait_gain(datum/source)
	if(stat < UNCONSCIOUS)
		set_stat(UNCONSCIOUS)

///Called when TRAIT_KNOCKEDOUT is removed from the mob.
/mob/living/proc/on_knockedout_trait_loss(datum/source)
	if(stat <= UNCONSCIOUS)
		update_stat()


///Called when TRAIT_DEATHCOMA is added to the mob.
/mob/living/proc/on_deathcoma_trait_gain(datum/source)
	ADD_TRAIT(src, TRAIT_KNOCKEDOUT, TRAIT_DEATHCOMA)

///Called when TRAIT_DEATHCOMA is removed from the mob.
/mob/living/proc/on_deathcoma_trait_loss(datum/source)
	REMOVE_TRAIT(src, TRAIT_KNOCKEDOUT, TRAIT_DEATHCOMA)

/// Called when traits that alter succumbing are added/removed.
/// Will show or hide the succumb alert prompt.
/mob/living/proc/update_succumb_action()
	if (CAN_SUCCUMB(src))
		throw_alert("succumb", /atom/movable/screen/alert/succumb)
	else
		clear_alert("succumb")
