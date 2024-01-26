/// obj_ParticleManagerLower : Draw

var i = 0;
while (i < ds_list_size(particles))
{
	var part = particles[| i];
	
	part.update();
	part.draw();
	
	if (part.life <= 0) ds_list_delete(particles, i);
	else i++;
}