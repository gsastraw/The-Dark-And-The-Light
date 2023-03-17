var id: int;
var attributes = {};
var layerId = -1;
var child_nodes = [];
var models = {};
var transforms = { 0: { "translation": Vector3(), "rotation": Basis() } };

func _init(id, attributes):
	self.id = id;
	self.attributes = attributes;