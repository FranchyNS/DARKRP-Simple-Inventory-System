-- =========================================
-- DarkRP Inventory System
-- By Franchy
-- =========================================

INV = INV or {}
INV.ClientInventory = {}

net.Receive("INV_OpenMenu", function()
    INV.ClientInventory = net.ReadTable() or {}
    if INV.OpenMenu then
        INV.OpenMenu()
    end
end)
