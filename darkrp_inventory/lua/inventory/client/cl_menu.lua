-- =========================================
-- DarkRP Inventory System
-- Client Menu 
-- By Franchy
-- =========================================

INV = INV or {}

function INV.OpenMenu()
    if IsValid(INV.Frame) then INV.Frame:Remove() end

    local w, h = INV.Menu.Width, INV.Menu.Height

    local frame = vgui.Create("DFrame")
    frame:SetSize(w, h)
    frame:SetPos((ScrW() - w) / 2, ScrH() - h)
    frame:SetTitle("Inventario")
    frame:MakePopup()
    INV.Frame = frame

    -- Fondo translúcido oscuro del frame
    function frame:Paint(w, h)
        surface.SetDrawColor(20, 20, 20, 200)
        surface.DrawRect(0, 0, w, h)
    end

    local grid = vgui.Create("DIconLayout", frame)
    grid:Dock(FILL)
    grid:SetSpaceX(8)
    grid:SetSpaceY(8)
    grid:DockMargin(10, 10, 10, 10)

    for slot, item in pairs(INV.ClientInventory or {}) do
        local panel = grid:Add("DButton")
        panel:SetSize(INV.Menu.SlotSize, INV.Menu.SlotSize)
        panel:SetText("")

        panel.DoClick = function()
            net.Start("INV_RequestTake")
            net.WriteUInt(slot, 8)
            net.SendToServer()
            frame:Close()
        end

        -- Renderizar modelo 3D del arma
        function panel:Paint(w, h)
            local wep = weapons.Get(item.class)
            if wep then
                local model = wep.WorldModel or wep.Model
                if model then
                    -- Fondo rojizo menos translúcido
                    surface.SetDrawColor(180, 50, 50, 220)
                    surface.DrawRect(0, 0, w, h)
                    
                    local x, y = self:LocalToScreen(0, 0)
                    cam.Start3D()
                    cam.IgnoreZ(true)
                    
                    render.SetMaterial(Material("white"))
                    local ent = ClientsideModel(model)
                    if IsValid(ent) then
                        ent:SetPos(Vector(0, 0, 0))
                        ent:SetAngles(Angle(0, CurTime() * 60, 0))
                        ent:DrawModel()
                    end
                    
                    cam.IgnoreZ(false)
                    cam.End3D()
                end
            end
            
            -- Dibujar nombre del objeto en la parte inferior
            surface.SetFont("DermaDefault")
            local itemName = wep and wep.PrintName or item.class
            local textW, textH = surface.GetTextSize(itemName)
            
            -- Fondo oscuro para el texto
            surface.SetDrawColor(0, 0, 0, 200)
            surface.DrawRect(0, h - 20, w, 20)
            
            -- Texto del nombre
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(w/2 - textW/2, h - 18)
            surface.DrawText(itemName)
        end
    end
end

-- Inventario desde el menú tecla [C]
if INV.UseContextMenu then
    hook.Add("OnContextMenuOpen", "INV_ContextMenu", function()
        net.Start("INV_OpenMenu")
        net.SendToServer()
    end)
    
    -- Cerrar el menú cuando se suelta la tecla C
    hook.Add("OnContextMenuClose", "INV_ContextMenuClose", function()
        if IsValid(INV.Frame) then
            INV.Frame:Close()
        end
    end)
end
