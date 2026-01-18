-- =========================================
-- DarkRP Inventory System
-- SQLite Database
-- By Franchy
-- =========================================

INV = INV or {}

-- ===============================
-- INICIALIZAR BASE DE DATOS
-- ===============================

function INV.InitDatabase()
    sql.Query([[
        CREATE TABLE IF NOT EXISTS darkrp_inventory (
            steamid TEXT PRIMARY KEY,
            inventory TEXT
        );
    ]])

    if sql.LastError() then
        print("[INV][ERROR] SQLite:", sql.LastError())
    else
        print("[INV] SQLite database initialized")
    end
end

hook.Add("Initialize", "INV_InitDatabase", INV.InitDatabase)

-- ===============================
-- GUARDAR INVENTARIO
-- ===============================

function INV.SaveInventory(ply)
    if not IsValid(ply) then return end

    ply.Inventory = ply.Inventory or {}

    local json = util.TableToJSON(ply.Inventory)
    local steamid = ply:SteamID64()

    sql.Query(string.format([[
        REPLACE INTO darkrp_inventory (steamid, inventory)
        VALUES (%s, %s);
    ]],
        sql.SQLStr(steamid),
        sql.SQLStr(json)
    ))

    if INV.Debug and sql.LastError() then
        print("[INV][ERROR] Save:", sql.LastError())
    end
end

-- ===============================
-- CARGAR INVENTARIO
-- ===============================

function INV.LoadInventory(ply)
    if not IsValid(ply) then return end

    local steamid = ply:SteamID64()

    local row = sql.QueryRow(string.format([[
        SELECT inventory FROM darkrp_inventory
        WHERE steamid = %s;
    ]],
        sql.SQLStr(steamid)
    ))

    if row and row.inventory then
        ply.Inventory = util.JSONToTable(row.inventory) or {}
    else
        ply.Inventory = {}
    end
end

-- ===============================
-- HOOKS DE GUARDADO
-- ===============================

hook.Add("PlayerInitialSpawn", "INV_LoadInventory", function(ply)
    -- Delay para evitar race conditions
    timer.Simple(1, function()
        if IsValid(ply) then
            INV.LoadInventory(ply)
        end
    end)
end)

hook.Add("PlayerDisconnected", "INV_SaveInventory", function(ply)
    INV.SaveInventory(ply)
end)

hook.Add("ShutDown", "INV_SaveAll", function()
    for _, ply in ipairs(player.GetAll()) do
        INV.SaveInventory(ply)
    end
end)

-- ===============================
-- AUTOSAVE
-- ===============================

if INV.AutoSave then
    timer.Create("INV_AutoSave", INV.AutoSaveTime, 0, function()
        for _, ply in ipairs(player.GetAll()) do
            INV.SaveInventory(ply)
        end
    end)
end
