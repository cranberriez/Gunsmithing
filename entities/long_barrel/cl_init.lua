include("shared.lua")

function ENT:Draw()
  self:DrawModel()

  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  local pos = self:GetPos()

  cam.Start3D2D(pos, ang, .05)
    draw.SimpleText("Long Barrel","Item", 0, -150, Color(255,255,255),1,1)
  cam.End3D2D()


  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 180)
  local pos = self:GetPos()

  cam.Start3D2D(pos, ang, .05)
    draw.SimpleText("Long Barrel","Item", 0, -150, Color(255,255,255),1,1)
  cam.End3D2D()

end

surface.CreateFont( "Item",
{
	font = "Arial",
	extended = false,
	size = 60,
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
