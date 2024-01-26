/// obj_Manager : Draw

// Entity lighting
var surface = new CameraSurface(global.camera);

draw_set_alpha(0.6);
surface.cs_draw_rectangle_color(global.camera.x, global.camera.y, global.camera.x + global.camera.width, global.camera.y + global.camera.height, c_black);
draw_set_alpha(1);

with (par_Entity) surface.cs_draw_light_ring(x, y, lightRingSize);
with (par_Projectile) surface.cs_draw_light_ring(x, y, lightRingSize);

surface.draw();
surface.delete_surface();
delete surface;