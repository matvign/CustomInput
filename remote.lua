local keyboard = libs.keyboard;
local mouse = libs.mouse;

dragging = false;

function endDrag()
	dragging = false;
	mouse.dragend();
	mouse.up();
end

actions.scroll_up = function()
	if (settings.usemouse == "1") then
		mouse.vscroll(settings.mousescroll);
	else
		for i = 0, settings.linescroll do
			keyboard.press("up");
		end
	end
end

actions.scroll_down = function()
	if (settings.usemouse == "1") then
		mouse.vscroll(-settings.mousescroll);
	else
		for i = 0, settings.linescroll do
			keyboard.press("down");
		end
	end
end

actions.tap = function()
	if (dragging) then
		endDrag();
	else
		mouse.click("left");
	end
end

actions.double = function()
  mouse.click("right");
end

actions.hold = function()
	mouse.down();
	mouse.dragbegin();
	dragging = true;
end

actions.onup = function()
  if (dragging == true and settings.autodrop == "1") then
    endDrag();
	end
end

actions.delta = function(id, x, y)
	mouse.moveraw(x, y);
end

actions.clickDrop = function()
	if (dragging) then
		endDrag();
	end
end

actions.leftClick = function()
	mouse.click("left");
end

actions.rightClick = function()
	mouse.click("right");
end
