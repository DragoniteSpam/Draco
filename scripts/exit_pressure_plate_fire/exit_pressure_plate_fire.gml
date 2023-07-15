function exit_pressure_plate_fire() {
	exit_pressure_plate();

	if (emitter!=noone) with (emitter){
		instance_destroy();
	}


}
