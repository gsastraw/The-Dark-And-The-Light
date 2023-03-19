extends Area2D
signal item_dropped

"""
Removes any overlapping Area2Ds
on user click up 
"""

func _input(event):
	
	if event.is_action_released("ui_touch"):
		for _a in get_overlapping_areas():
			
			_a.get_node("CollisionShape2D").queue_free() # Using Disable didnt work
			emit_signal("item_dropped")
