extends Node

signal pickable_entered(pickable: Pickable)
signal pickable_exited(pickable: Pickable)
signal character_entered(character: Character)
signal character_exited(character: Character)

var picked: Pickable = null
var dave: Dave = null
