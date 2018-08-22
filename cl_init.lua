include("shared.lua")

local weapons = {
  'MR96',
  'P99',
  'PM',
  'M1911',
  'DEAGLE',
	'AK',
  'AR15',
  'SCAR-H',
  'G36C',
  'UMP45',
	'MP5',
  'L115',
  'M60',
  'MK11',
  'M14',
	'M3',
  'G3A3',
  'MAC-11',
	'UMP45',
	'MP5',
  'L115',
  'M60',
  'MK11',
  'M14',
	'M3',
  'G3A3',

}

surface.CreateFont( "Heading", {
	font = "Arial",
	extended = false,
	size = 100,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "Default", {
	font = "Arial",
	extended = false,
	size = 40,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

-- Width = 2224
-- Height = 505

function ENT:Draw()
  self:DrawModel()

  local bWidth = 2224
  local bHeight = 700

  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 90)

  local pos = self:GetPos() + (self:GetAngles():Right() * 55.6) + (self:GetAngles():Forward() * -21) + (self:GetAngles():Up() * 50)

  cam.Start3D2D(pos, ang, .05)
    draw.RoundedBox(0,0,0,bWidth,bHeight,Color(100,100,100,100))
    draw.SimpleText("Gunsmithing Table","Heading", bWidth/2, 0, Color(255,255,255),1,2)
    draw.SimpleText("Select the weapon you wish to craft","Default", bWidth/2, 100, Color(255,255,255),1,2)

    -- Drawing Variables
		local x = 10
		local y = 200
		local columns = 10
		local boxWidth = bWidth/columns
		local maxRows = 3

		for i = 1, table.getn(weapons) do

			if x >= boxWidth*columns then
				x = 10
				y = y + 120
			end

			if (y-200) / 120 > maxRows then
        break
      end

			draw.RoundedBox(0, x, y, boxWidth-20, 100, Color(63,79,127))
      draw.SimpleText(weapons[i], "Default", x + boxWidth/2 - 10, y+50, Color(255,255,255),1,1)
			x = x + boxWidth
		end
  cam.End3D2D()
end
