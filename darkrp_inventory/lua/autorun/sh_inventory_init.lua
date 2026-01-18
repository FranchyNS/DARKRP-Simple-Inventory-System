-- DARKRP INVENTORY SYSTEM 
-- By Franchy
print("### INVENTORY AUTORUN CARGADO ###")

INV = INV or {}

-- 1. Archivos Compartidos (Shared)
if SERVER then
    AddCSLuaFile("inventory/sh_config.lua")
    AddCSLuaFile("inventory/sh_inventory.lua")
    AddCSLuaFile("inventory/client/cl_inventory.lua")
    AddCSLuaFile("inventory/client/cl_menu.lua")
    
    include("inventory/sh_config.lua")
    include("inventory/sh_inventory.lua")
    include("inventory/server/sv_database.lua")
    include("inventory/server/sv_inventory.lua")
    
    print("[INV] DarkRP Inventory system loaded successfully")
end

if CLIENT then
    include("inventory/sh_config.lua")
    include("inventory/sh_inventory.lua")
    include("inventory/client/cl_inventory.lua")
    include("inventory/client/cl_menu.lua")
end