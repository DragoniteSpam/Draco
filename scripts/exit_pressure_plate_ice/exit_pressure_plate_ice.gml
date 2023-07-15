function exit_pressure_plate_ice() {
	exit_pressure_plate();

	if (emitter!=noone) with (emitter){
		instance_destroy();
	}


}
