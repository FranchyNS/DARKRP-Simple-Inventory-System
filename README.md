================================================================================
                      DARKRP INVENTORY SYSTEM
================================================================================

Author: Franchy

================================================================================
DESCRIPTION
================================================================================

A complete inventory system for Garry's Mod DarkRP that allows players to store 
and manage their weapons in an intuitive visual menu.

Key features:
- Weapon storage with 3D model visualization
- Inventory menu accessible with the C key
- Expandable slot system based on user rank
- Database for inventory persistence
- Visual interface with weapon model preview
- Ammunition saving support

================================================================================
INSTALLATION
================================================================================

1. Extract the "darkrp_inventory" folder into: garrysmod/addons/
2. Restart the Garry's Mod server
3. The addon will load automatically

================================================================================
CONFIGURATION
================================================================================

Edit the file: lua/inventory/sh_config.lua

Available options:
- MaxSlots: Maximum number of default slots (10)
- SaveAmmo: Save weapon ammunition (true/false)
- AutoSave: Automatically save inventory (true/false)
- AutoSaveTime: Time between automatic saves in seconds (120)
- AllowDroppedWeapons: Allow saving dropped weapons (true/false)
- UseContextMenu: Open inventory with C key (true/false)
- StoreCommand: Chat command to save current weapon (/guardararma)
- SlotSize: Size in pixels of inventory icons (96)
- BlacklistWeapons: List of weapons that cannot be saved

Extra slots by rank:
- vip: +5 slots
- admin: +10 slots
- superadmin: +20 slots

================================================================================
USAGE
================================================================================

Client:
1. Press the C key to open the inventory menu
2. Click on a weapon to equip it
3. Release the C key to close the menu

Server:
- Commands are sent automatically via networking

================================================================================
FILE STRUCTURE
================================================================================

darkrp_inventory/
├── lua/
│   ├── autorun/
│   │   └── sh_inventory_init.lua       (Initialization)
│   ├── inventory/
│   │   ├── sh_config.lua               (General configuration)
│   │   ├── sh_inventory.lua            (Shared functions)
│   │   ├── client/
│   │   │   ├── cl_inventory.lua        (Client logic)
│   │   │   └── cl_menu.lua             (Visual interface)
│   │   └── server/
│   │       ├── sv_database.lua         (Database management)
│   │       └── sv_inventory.lua        (Server logic)
│   └── weapons/
│       └── weapon_inventory.lua        (SWEP to save weapons)

================================================================================
CHAT COMMANDS
================================================================================

/guardararma - Save current weapon to inventory

================================================================================
MENU FEATURES
================================================================================

- 3D weapon model visualization with animated rotation
- Dark translucent background for better visibility
- Icons with reddish background (96x96 pixels)
- Weapon name visible at the bottom of each icon
- Menu positioned at the bottom of the screen
- Opens when pressing C and closes when releasing the key
- Automatic docking system for elements

================================================================================
REQUIREMENTS
================================================================================

- Garry's Mod (Latest version)
- Modified or compatible DarkRP
- Server access for installation

================================================================================
SUPPORT
================================================================================

To report bugs or suggestions, contact the author: Franchy

================================================================================
LICENSE
================================================================================

This addon has been developed for use on DarkRP servers.
Its use, distribution, and modification are allowed freely.

================================================================================
IMPORTANT NOTES
================================================================================

- The addon requires DarkRP to be installed
- The database must be properly configured
- It is recommended to backup the database regularly
- Weapons on the blacklist cannot be saved
- The persistence system saves inventory on the server

================================================================================

                          --- ESPAÑOL ---
================================================================================
                      DARKRP INVENTORY SYSTEM
================================================================================

Autor: Franchy

================================================================================
DESCRIPCIÓN
================================================================================

Un sistema completo de inventario para Garry's Mod DarkRP que permite a los 
jugadores guardar y gestionar sus armas en un menú visual intuitivo.

Características principales:
- Almacenamiento de armas con visualización 3D
- Menú de inventario accesible con la tecla C
- Sistema de slots expansible según el rango de usuario
- Base de datos para persistencia de inventario
- Interfaz visual con vista previa de modelos de armas
- Soporte para guardar munición

================================================================================
INSTALACIÓN
================================================================================

1. Extrae la carpeta "darkrp_inventory" en: garrysmod/addons/
2. Reinicia el servidor Garry's Mod
3. El addon se cargará automáticamente

================================================================================
CONFIGURACIÓN
================================================================================

Edita el archivo: lua/inventory/sh_config.lua

Opciones disponibles:
- MaxSlots: Cantidad máxima de slots por defecto (10)
- SaveAmmo: Guardar munición de las armas (true/false)
- AutoSave: Guardar automáticamente el inventario (true/false)
- AutoSaveTime: Tiempo entre guardados automáticos en segundos (120)
- AllowDroppedWeapons: Permitir guardar armas droppeadas (true/false)
- UseContextMenu: Abrir inventario con tecla C (true/false)
- StoreCommand: Comando de chat para guardar arma actual (/guardararma)
- SlotSize: Tamaño en píxeles de los iconos del inventario (96)
- BlacklistWeapons: Lista de armas que no se pueden guardar

Slots extras por rango:
- vip: +5 slots
- admin: +10 slots
- superadmin: +20 slots

================================================================================
USO
================================================================================

Cliente:
1. Presiona la tecla C para abrir el menú del inventario
2. Haz click en un arma para equiparla
3. Suelta la tecla C para cerrar el menú

Servidor:
- Los comandos se envían automáticamente vía networking

================================================================================
ESTRUCTURA DE ARCHIVOS
================================================================================

darkrp_inventory/
├── lua/
│   ├── autorun/
│   │   └── sh_inventory_init.lua       (Inicialización)
│   ├── inventory/
│   │   ├── sh_config.lua               (Configuración general)
│   │   ├── sh_inventory.lua            (Funciones compartidas)
│   │   ├── client/
│   │   │   ├── cl_inventory.lua        (Lógica del cliente)
│   │   │   └── cl_menu.lua             (Interfaz visual)
│   │   └── server/
│   │       ├── sv_database.lua         (Gestión de base de datos)
│   │       └── sv_inventory.lua        (Lógica del servidor)
│   └── weapons/
│       └── weapon_inventory.lua        (SWEP para guardar armas)

================================================================================
COMANDOS DE CHAT
================================================================================

/guardararma - Guarda el arma actual en el inventario

================================================================================
CARACTERÍSTICAS DEL MENÚ
================================================================================

- Visualización 3D de modelos de armas con rotación animada
- Fondo translúcido oscuro para mejor visibilidad
- Iconos con fondo rojizo (tamaño 96x96 píxeles)
- Nombre del arma visible en la parte inferior de cada icono
- Menú posicionado en la parte inferior de la pantalla
- Se abre al presionar C y se cierra al soltar la tecla
- Sistema de docking automático para los elementos

================================================================================
REQUISITOS
================================================================================

- Garry's Mod (Última versión)
- DarkRP modificado o compatible
- Acceso al servidor para instalación

================================================================================
SOPORTE
================================================================================

Para reportar errores o sugerencias, contacta al autor: Franchy

================================================================================
LICENCIA
================================================================================

Este addon ha sido desarrollado para uso en servidores DarkRP.
Se permite su uso, distribución y modificación libremente.

================================================================================
NOTAS IMPORTANTES
================================================================================

- El addon requiere que DarkRP esté instalado
- La base de datos debe estar correctamente configurada
- Se recomienda hacer backup de la base de datos regularmente
- Las armas en la blacklist no se pueden guardar
- El sistema de persistencia guarda el inventario en servidor

================================================================================
                                FIN
================================================================================
