function trod_pressure_plate_sparks() {
	trod_pressure_plate();

	emitter=mo_spark(xx, yy, 60);

	APPLY_FIELD_DAMAGE(Player.actor_index, MagicFlags.shock, 5);
	APPLY_FIELD_DAMAGE_MAGICKA(Player.actor_index, 5);


}
