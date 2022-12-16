// NOTE: Shader automatically converted from Godot Engine 3.5.1.stable's CanvasItemMaterial.

shader_type canvas_item;

uniform float vel = -0.5f;
uniform float des = 0.f;
uniform float time = 0.f;

void fragment(){
  COLOR = texture(TEXTURE, UV + (vec2(0, 1.f) * time * vel) + vec2(des, 0));
}
