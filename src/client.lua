local screenW, screenH = guiGetScreenSize()
local x,y = screenW/1920, screenH/1080


function renderizar_tela()
    local usarOpacidade = isMouseInPosition(x*382, y*245, x*106, y*39) and (255*0.70) or (255)
    local droparOpacidade = isMouseInPosition(x*537, y*245, x*106, y*39) and (255*0.70) or (255)

    dxDrawRoundedRectangle(x*285, y*222, x*455, y*636, 16, tocolor(20, 20, 20, 255))

    dxDrawRoundedRectangle(x*382, y*245, x*106, y*39, 8, tocolor(139, 49, 49, usarOpacidade))
    dxDrawText("Usar", x*382, y*245, x*(106+382), y*(39+245), tocolor(255, 255, 255, usarOpacidade), 1, 'default', 'center', 'center')

    dxDrawRoundedRectangle(x*537, y*245, x*106, y*39, 8, tocolor(139, 49, 49, droparOpacidade))
    dxDrawText("Dropar", x*537, y*245, x*(106+537), y*(39+245), tocolor(255, 255, 255, droparOpacidade), 1, 'default', 'center', 'center')
    
end
addEventHandler("onClientRender", root, renderizar_tela)

function dxDrawRoundedRectangle(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end