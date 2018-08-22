include("shared.lua")

local bodies = {"Long Rifle Body","LMG Body","AR Body","Shotgun Body","SMG Body","Pistol Body"}
local storedParts = {}

local rifle = {L115 = {"Long_Barrel","Scope","Stock"}, M14_EBR = {"Long_Barrel","Stock"}, MK_11 = {"Heavy_Barrel","Stock"}}
local mode = 0

local function drawWeps(weapon,r,g,b)
  local x = 10
  local y = 200
  local columns = table.getn(bodies)
  local boxWidth = (bWidth-10)/columns
  local maxRows = 3


  for key, val in pairs(weapon) do
    draw.RoundedBox(0,x,y,boxWidth - 10,100,Color(r,g,b,100))
    draw.SimpleText(key:gsub('%_', ' '),"Item", x + boxWidth/2, y + 50, Color(255,255,255),1,1)
    for i=1, table.getn(val) do
      if table.HasValue(storedParts, val[i]:lower()) then
        draw.RoundedBox(0,x, y + 20 + 90*i, boxWidth - 10, 80, Color(r,g,b,20))
      else
        draw.RoundedBox(0,x, y + 20 + 90*i, boxWidth - 10, 80, Color(0,0,0,100))
      end
      draw.SimpleText(val[i]:gsub('%_', ' '),"Default", x + boxWidth/2, y + 60 + 90*i, Color(255,255,255),1,1)
    end
    x = x + boxWidth
  end
end


local function drawBodies()
  local x = 10
  local y = 200
  local columns = table.getn(bodies)
  local boxWidth = (bWidth-10)/columns
  local maxRows = 3

  for key, val in pairs(bodies) do
    if x >= (bWidth) then
      x = 10
      y = y + 120
    end

    draw.RoundedBox(0,x,y,boxWidth - 10,100,Color(63,0,127,200))
    draw.SimpleText(val,"Default", x + boxWidth/2, y + 50, Color(255,255,255),1,1)
    x = x + boxWidth
  end
end

function ENT:Draw()
  self:DrawModel()

  bWidth = 2224
  bHeight = 700

  local ang = self:GetAngles()
  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
  ang:RotateAroundAxis(self:GetAngles():Up(), 90)

  local pos = self:GetPos() + (self:GetAngles():Right() * 55.6) + (self:GetAngles():Forward() * -21) + (self:GetAngles():Up() * 50)

  cam.Start3D2D(pos, ang, .05)
    draw.RoundedBox(0,0,0,bWidth,bHeight,Color(100,100,100,100))
    draw.SimpleText("geekmarine's Gunsmithing Table","Heading", bWidth/2, 0, Color(255,255,255),1,2)
    if table.getn(storedParts) < 3 then -- CHANGE IN FINAL VERSION
      draw.SimpleText("Press E to Reset (Consumes Body)","Default", 0+10, bHeight-60, Color(255,255,255),0,1)
    else -- CHANGE IN FINAL VERSION
      draw.SimpleText("Press E to Construct MK 11","Default", 0+10, bHeight-60, Color(255,255,255),0,1)
    end

    if mode == 1 then
      draw.SimpleText("Now add Corresponding Rifle Parts for the Weapon you Want","Default", bWidth/2, 100, Color(150,255,150),1,2)
      drawWeps(rifle,150,255,150)
    elseif mode == 2 then
      draw.SimpleText("Now add Corresponding LMG Parts for the Weapon you Want","Default", bWidth/2, 100, Color(255,150,150),1,2)
      drawWeps(lmg,255,150,150)
    else
      draw.SimpleText("Place a Weapon Body on the Table to get Started","Default", bWidth/2, 100, Color(255,255,255),1,2)
      drawBodies()
    end
  cam.End3D2D()

  mode = self:GetType()

  if mode == 0 then
    storedParts = {}
  end

end

local function GotTable(len,player)
  storedParts = net.ReadTable()
  PrintTable(storedParts)
end
net.Receive("sendParts", GotTable)

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
