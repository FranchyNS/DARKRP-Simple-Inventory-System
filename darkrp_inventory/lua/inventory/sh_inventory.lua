-- =========================================
-- DarkRP Inventory System
-- Shared Core
-- =========================================

INV = INV or {}

-- ===============================
-- UTILIDADES
-- ===============================

-- Calcula slots máximos de un jugador
function INV.GetMaxSlots(ply)
    if not IsValid(ply) then return INV.MaxSlots end

    local slots = INV.MaxSlots
    local group = ply:GetUserGroup()

    slots = slots + (INV.ExtraSlotsByGroup[group] or 0)

    return slots
end

-- Devuelve cuántos slots ocupados tiene
function INV.GetUsedSlots(ply)
    ply.Inventory = ply.Inventory or {}
    return table.Count(ply.Inventory)
end

-- ¿Tiene espacio?
function INV.HasFreeSlot(ply)
    return INV.GetUsedSlots(ply) < INV.GetMaxSlots(ply)
end



-- ¿Se puede guardar esta arma?
function INV.CanStoreWeapon(ply, class)
    if not class then return false end
    if INV.BlacklistWeapons[class] then return false end
    if not weapons.Get(class) then return false end

    return true
end

-- ===============================
-- MANIPULACIÓN INVENTARIO
-- ===============================

-- Añadir arma al inventario
function INV.AddWeapon(ply, class, ammo)
    if not INV.CanStoreWeapon(ply, class) then return false end
    if not INV.HasFreeSlot(ply) then return false end

    ply.Inventory = ply.Inventory or {}

    table.insert(ply.Inventory, {
        class = class,
        ammo = ammo or 0
    })

    return true
end

-- Quitar arma por slot
function INV.RemoveWeapon(ply, slot)
    ply.Inventory = ply.Inventory or {}
    if not ply.Inventory[slot] then return false end

    ply.Inventory[slot] = nil
    return true
end

-- Obtener item por slot
function INV.GetWeapon(ply, slot)
    ply.Inventory = ply.Inventory or {}
    return ply.Inventory[slot]
end

-- ===============================
-- NETWORK STRINGS
-- ===============================
if SERVER then
    util.AddNetworkString("INV_OpenMenu")
    util.AddNetworkString("INV_RequestTake")
end
