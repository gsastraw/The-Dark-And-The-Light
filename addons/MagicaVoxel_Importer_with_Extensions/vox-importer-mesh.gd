tool
extends EditorImportPlugin

const VoxImporterCommon = preload("./vox-importer-common.gd");

func _init():
	print('MagicaVoxel Mesh Importer: Ready')

func get_importer_name():
	return 'MagicaVoxel.With.Extensions.To.Mesh'

func get_visible_name():
	return 'MagicaVoxel Mesh'

func get_recognized_extensions():
	return [ 'vox' ]

func get_resource_type():
	return 'Mesh'

func get_save_extension():
	return 'mesh'

func get_preset_count():
	return 0

func get_preset_name(_preset):
	return 'Default'

func get_import_options(_preset):
	return [
		{
			'name': 'Scale',
			'default_value': 0.1
		},
		{
			'name': 'GreedyMeshGenerator',
			'default_value': true
		},
		{
			'name': 'SnapToGround',
			'default_value': false
		},
		{
			'name': 'FirstKeyframeOnly',
			'default_value': true
		}
	]

func get_option_visibility(_option, _options):
	return true

func import(source_path, destination_path, options, _platforms, _gen_files):
	var meshes = VoxImporterCommon.new().import(source_path, destination_path, options, _platforms, _gen_files);
	var full_path = "%s.%s" % [ destination_path, get_save_extension() ]
	return ResourceSaver.save(full_path, meshes[0])
