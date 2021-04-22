extends UnitTest

var input: InputReader


func before_each():
	input = autofree(InputReader.new())


func test_single_input():
	input.handle_input(press_key("ui_left"))
	assert_true(input.is_pressed("ui_left"))

	input.handle_input(release_key("ui_left"))
	assert_false(input.is_pressed("ui_left"))


func test_multiple_input():
	input.handle_input(press_key("ui_left"))
	input.handle_input(press_key("ui_right"))

	assert_true(input.is_pressed("ui_left"))
	assert_true(input.is_pressed("ui_right"))

	input.handle_input(release_key("ui_right"))
	assert_true(input.is_pressed("ui_left"))
	assert_false(input.is_pressed("ui_right"))


func test_action_strength():
	input.handle_input(press_key("ui_left", 1))
	assert_eq(input.get_action_strength("ui_left"), 1.0)

	input.handle_input(joypad_motion_event(JOY_AXIS_0, 1))
	assert_eq(input.get_action_strength("ui_right"), 1.0)

	assert_eq(input.get_action_strength("ui_up"), 0.0)


func test_just_pressed():
	input.handle_input(press_key("ui_left"))
	assert_true(input.is_just_pressed("ui_left"))

	simulate(input, 1, 1)
	assert_false(input.is_just_pressed("ui_left"))
