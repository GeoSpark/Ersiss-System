# Copyright (c) 2020 The Eriss-System Project Contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

extends KinematicBody

signal changed(index)
export var index = 0
export var positions = 6
var knob
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("changed",index)
	knob = get_node("Knob")
	audio = get_node("AudioPlay")

func _input_event( _camera,  event,  _click_position,  _click_normal,  _shape_idx ):
	if (event.is_action_pressed("ui_click")):
		index = (index+1)%positions
		knob.rotate_y(2*PI/positions)
		audio.play()
		emit_signal("changed",index)
	if (event.is_action_pressed("ui_click_alt")):
		index = (index+positions-1)%positions
		knob.rotate_y(-2*PI/positions)
		audio.play()
		emit_signal("changed",index)
