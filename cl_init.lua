include("shared.lua")

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

  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 90)

  local pos = self:GetPos() + (self:GetAngles():Right() * 55.6) + (self:GetAngles():Forward() * -21) + (self:GetAngles():Up() * 42)

  cam.Start3D2D(pos, ang, .05)
    draw.RoundedBox(0,0,0,2224,505,Color(100,100,100,100))
    draw.SimpleText("geekmarine's Gunsmithing Table","Heading", 2224/2, 0, Color(255,255,255),1,1)
    draw.SimpleText("Select the weapon you wish to craft","Default", 2224/2, 50, Color(255,255,255),1,2)
    draw.RoundedBox(0,2224/2-100/2 ,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 150,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 300,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 450,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 600,505/2-100/2,100,100,Color(63,79,127))

    draw.RoundedBox(0,2224/2-100/2 + 150,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 300,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 450,505/2-100/2,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 600,505/2-100/2,100,100,Color(63,79,127))

    draw.RoundedBox(0,2224/2-100/2      ,505/2-100/2 + 150     ,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 150,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 300,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 450,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 - 600,505/2-100/2 + 150,100,100,Color(63,79,127))

    draw.RoundedBox(0,2224/2-100/2 + 150,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 300,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 450,505/2-100/2 + 150,100,100,Color(63,79,127))
    draw.RoundedBox(0,2224/2-100/2 + 600,505/2-100/2 + 150,100,100,Color(63,79,127))
  cam.End3D2D()
end
