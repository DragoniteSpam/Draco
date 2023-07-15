function trod_pressure_plate_fire() {
	trod_pressure_plate();

	emitter=mo_fire(xx, yy, 60);

	APPLY_FIELD_DAMAGE(Player.actor_index, MagicFlags.fire, 5);
	AddActiveEffect(AllEffects.FieldBurn, Player.actor_index, 1, 5, false);


}
