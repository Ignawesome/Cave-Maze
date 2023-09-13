extends Node


const interactions := {
	"Key" : ["Door", "Suitcase", "Box", "Chest"],
	"Phone" : ["Henry", "Mary"],
	"Berkano" : ["Isaac"]
}

func check_interaction(item_name : String , other_item_name : String):
	if item_name in interactions:
		if other_item_name in interactions[item_name]:
			return true
	else:
		return false
		
func use_item_with_item(item : ItemResource, other_item : ItemResource):
	if (item.name in other_item.combinations) or (other_item.name in item.combinations):
		return true
	else:
		return false
