extends UnitTest

var empty_input: EmptyPlayerInput


func before_each():
	empty_input = autofree(EmptyPlayerInput.new())


func test_no_inputs():
	empty_input.handle_input(press_key("ui_right"))
	assert_false(empty_input.is_pressed("ui_right"))

	empty_input.handle_input(joypad_motion_event(JOY_AXIS_0, 1))
	assert_eq(empty_input.get_action_strength("ui_right"), 0.0)
