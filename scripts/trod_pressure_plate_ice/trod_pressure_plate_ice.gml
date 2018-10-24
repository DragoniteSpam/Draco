trod_pressure_plate();

emitter=mo_ice(xx, yy, 60);

APPLY_FIELD_DAMAGE(Player.actor_index, MagicFlags.ice, 5);
APPLY_FIELD_DAMAGE_STAMINA(Player.actor_index, 5);