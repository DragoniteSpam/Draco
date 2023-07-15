function exit_pressure_plate_sparks() {
	exit_pressure_plate();

	if (emitter!=noone) with (emitter){
		instance_destroy();
	}


}
