/// Sprites
/// Klehrik

// Functions to make handling sprite changes easier.

	
function sprite_change(sprite, image = 0, _image_speed = 1, loop = true)
{
	if (sprite_index != sprite)
	{
		sprite_index = sprite;
		image_index = image;
		image_speed = _image_speed;
		spriteLoop = loop;
	}
}
	
function sprite_check()
{
	if (!spriteLoop and image_index >= sprite_get_number(sprite_index) - 1) image_speed = 0;
}