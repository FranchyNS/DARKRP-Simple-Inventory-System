-- =========================================
-- DarkRP Inventory System
-- Server Logic
-- =========================================

INV = INV or {}


hook.Add("PlayerSay", "INV_StoreWeaponCommand", function(ply, text)
    if string.lower(text) ~= string.lower(INV.StoreCommand) then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then
        DarkRP.notify(ply, 1, 4, "No tienes ningún arma en la mano")
        return ""
    end

    local class = wep:GetClass()

    if not INV.CanStoreWeapon(ply, class) then
        DarkRP.notify(ply, 1, 4, "No puedes guardar esta arma")
        return ""
    end

    if not INV.HasFreeSlot(ply) then
        DarkRP.notify(ply, 1, 4, "Inventario lleno")
        return ""
    end

    local ammo = 0
    if INV.SaveAmmo then
        ammo = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
    end

    INV.AddWeapon(ply, class, ammo)
    ply:StripWeapon(class)

    DarkRP.notify(ply, 0, 4, "Arma guardada en el inventario")
    return ""
end)


net.Receive("INV_RequestTake", function(len, ply)
    local slot = net.ReadUInt(8)
    local item = INV.GetWeapon(ply, slot)
    if not item then return end

    -- Seguridad básica
    if not weapons.Get(item.class) then
        INV.RemoveWeapon(ply, slot)
        return
    end

    -- Dar arma
    ply:Give(item.class)

    if INV.SaveAmmo and item.ammo and item.ammo > 0 then
        local wep = ply:GetWeapon(item.class)
        if IsValid(wep) then
            ply:GiveAmmo(item.ammo, wep:GetPrimaryAmmoType())
        end
    end

    INV.RemoveWeapon(ply, slot)
end)


net.Receive("INV_OpenMenu", function(_, ply)
    net.Start("INV_OpenMenu")
    net.WriteTable(ply.Inventory or {})
    net.Send(ply)
end)
