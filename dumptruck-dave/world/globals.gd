extends Node

signal pickable_entered(pickable: Pickable)
signal pickable_exited(pickable: Pickable)
signal character_entered(character: Character)
signal character_exited(character: Character)
signal item_entered(item: Item)
signal item_exited(item: Item)

var picked: Pickable = null
var dave: Dave = null
var in_left_hand: bool = false
