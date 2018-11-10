local keyboard = libs.keyboard;
local mouse = libs.mouse;

dragging = false;

last = 0;

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

actions.hold = function()
  mouse.down();
	mouse.dragbegin();
	dragging = true;
end

-- on touch release
actions.onup = function()
  if (dragging == true and settings.autodrop == "1") then
    endDrag();
  end
end

actions.touchstart = function(id, x, y)
--print("TS: id"..id.."x"..x.."y"..y);
	last = id;
end

-- change in mouse
actions.delta = function(id, x, y)
--print("dl: id"..id.."x"..x.."y"..y);
	if (id == last) then
		mouse.moveraw(x, y);
	end

	if (dragging and id ~= last) then
		endDrag();
	end
end

actions.touchend = function(id, x, y)
--print("TE: id"..id.."x"..x.."y"..y);
end


-- functions for mouse buttons
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
