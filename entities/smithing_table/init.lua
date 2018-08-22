AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
  self:SetModel("models/props_wasteland/controlroom_desk001b.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)
  self:SetColor(Color(100,100,100))
  self:SetType(0)

  local phys = self:GetPhysicsObject()

  if phys:IsValid() then
    phys:Wake()
  end
end

local parts = {"long_barrel","short_barrel","heavy_barrel","stock","scope"}
local bodies = {"lr_body","lmg_body"}
local storedParts = {}
local rifle = {L115 = {"Long_Barrel","Scope","Stock"}, M14_EBR = {"Long_Barrel","Stock"}, MK_11 = {"Heavy_Barrel","Stock"}}
local classes = {rifle}

function ENT:StartTouch(entity)
  if (not table.HasValue(storedParts, entity:GetClass())) then

    if (self:GetType() == 0 or table.HasValue(bodies, entity:GetClass())) then
      table.insert(storedParts, entity:GetClass())
      if entity:GetClass() == "lr_body" then
        self:SetType(1)
        entity:Remove()
      elseif entity:GetClass() == "lmg_body" then
        self:SetType(2)
        entity:Remove()
      end

    elseif(self:GetType() ~= 0 and table.HasValue(parts, entity:GetClass())) then
      table.insert(storedParts, entity:GetClass())
      entity:Remove()
      util.AddNetworkString("sendParts")
      net.Start("sendParts")
      net.WriteTable(storedParts)
      net.WriteEntity(self)
      net.Broadcast()
    end

  end
end


function ENT:EndTouch(entity)
end

function ENT:Use(a, c)
  if table.getn(storedParts) >= 3 then  -- REMOVE IN FINAL VERSION

  end
  self:SetType(0)
  storedParts = {}
end
