-- =========================================
-- DarkRP Inventory System
-- By Franchy
-- GENERAL CONFIG
-- =========================================

INV = INV or {}

INV.MaxSlots = 10
INV.SaveAmmo = true
INV.AutoSave = true
INV.AutoSaveTime = 120 -- segundos

-- Permitir guardar armas dropeadas con el SWEP Inventario
INV.AllowDroppedWeapons = true


-- Armas prohibidas
INV.BlacklistWeapons = {
    ["weapon_physgun"] = true,
    ["gmod_tool"]      = true,
    ["weapon_physcannon"] = true
}


-- Permitir abrir el inventario desde el menú C
INV.UseContextMenu = true

-- Comando de chat para guardar arma actual
INV.StoreCommand = "/guardararma"


-- Slots extra por grupo de usuario
INV.ExtraSlotsByGroup = {
    ["vip"] = 5,
    ["admin"] = 10,
    ["superadmin"] = 20
}


INV.Menu = {
    Width = 600,
    Height = 400,
    SlotSize = 96
}


INV.Debug = false
