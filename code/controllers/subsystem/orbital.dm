#define ORBITAL_LEVEL_1 1
#define ORBITAL_LEVEL_2 2
#define ORBITAL_LEVEL_3 3
#define ORBITAL_LEVEL_4 4
#define ORBITAL_LEVEL_5 5

SUBSYSTEM_DEF(orbital)
	name = "Orbital Level"
	init_order = INIT_ORDER_ORBITAL

	flags = SS_NO_FIRE // we don't need to fire every single tick, this is just to handle interactions

	///The current orbital level of the ship.
	var/orbital_level = ORBITAL_LEVEL_3 // ship starts at orbital level 3

/datum/controller/subsystem/orbital/proc/alertShift()
	priority_announce("ORBITAL SHIFT DETECTED. APPROACHING ORBITAL LEVEL: [orbital_level]", "Orbital Shift Detector", sender_override = "Ship Infrastructure")

/datum/controller/subsystem/orbital/proc/shiftLevel(shift_to)
	if(shift_to)
		orbital_level = shift_to
		alertShift()
