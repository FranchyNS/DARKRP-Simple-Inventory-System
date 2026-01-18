AddCSLuaFile()

SWEP.PrintName = "Inventario"
SWEP.Author = "INV System"
SWEP.Instructions = "Click izquierdo: guardar arma"
SWEP.Category = "Inventory"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.ViewModel = "models/props_c17/suitcase001a.mdl"
SWEP.WorldModel = "models/weapons/w_suitcase_passenger.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:PrimaryAttack()
    if CLIENT then return end

    local ply = self:GetOwner()
    if not IsValid(ply) then return end

    local tr = ply:GetEyeTrace()
    local ent = tr.Entity

    if not IsValid(ent) or not ent:IsWeapon() then
        DarkRP.notify(ply, 1, 4, "No estás mirando un arma")
        return
    end

    local class = ent:GetClass()

    if not INV.CanStoreWeapon(ply, class) then
        DarkRP.notify(ply, 1, 4, "No puedes guardar esta arma")
        return
    end

    if not INV.HasFreeSlot(ply) then
        DarkRP.notify(ply, 1, 4, "Inventario lleno")
        return
    end

    INV.AddWeapon(ply, class, 0)
    ent:Remove()

    DarkRP.notify(ply, 0, 4, "Arma guardada en el inventario")
    self:SetNextPrimaryFire(CurTime() + 1)
end
