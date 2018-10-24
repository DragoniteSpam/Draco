trod_pressure_plate();

emitter=mo_fire(xx, yy, 60);

APPLY_FIELD_DAMAGE(Player.actor_index, MagicFlags.fire, 5);
AddActiveEffect(Player.actor_index, AllEffects.FieldBurn, 1, 5, false);