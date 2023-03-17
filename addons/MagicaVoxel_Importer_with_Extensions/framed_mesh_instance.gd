tool
extends MeshInstance


export(MeshLibrary) var frames = null setget set_frames
export(int) var current_frame = 0 setget set_current_frame


var mesh_count = 0;


func set_frames(v):
	frames = v;
	current_frame = 0
	if v == null:
		mesh_count = 0;
		self.mesh = null;
	else:
		mesh_count = v.get_item_list().size()
		self.mesh = v.get_item_mesh(0)


func set_current_frame(v):
	if v >= 0 and v < mesh_count:
		current_frame = v
		self.mesh = frames.get_item_mesh(v)
