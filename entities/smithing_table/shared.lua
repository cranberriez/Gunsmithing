ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Smithing Table"
ENT.Spawnable = true

function ENT:SetupDataTables()
  self:NetworkVar("Int",0,"Type")
  self:NetworkVar("String",0,"Gun")
  self:NetworkVar("Bool",0,"Short_Barrel")
  self:NetworkVar("Bool",1,"Long_Barrel")
  self:NetworkVar("Bool",2,"Heavy_Barrel")
  self:NetworkVar("Bool",3,"Scope")
  self:NetworkVar("Bool",4,"Stock")
end
