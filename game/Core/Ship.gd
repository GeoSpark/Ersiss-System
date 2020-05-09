extends OrbitalBody
class_name Ship

var systems : Dictionary
var components : Array

func _ready():
	systems = Dictionary()
	components = Array()
	register_systems()

func register_systems() -> void:
	get_systems_recursive(self)
	for component in components:
		if systems.has(component.system_name):
			systems[component.system_name].register_component(component)
		else :
			print("Error : No %s system found for component %s", component.system_name, component.name)

func get_systems_recursive(node : Node) -> void:
	for n in node.get_children():
		if n is System:
			systems[n.system_name] = n
		if n is Component:
			components.push_back(n)	
		if n.get_child_count() > 0:
			get_systems_recursive(n)