_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("La Faille - RP", "Car")
_menuPool:Add(mainMenu)
xPlayer = PlayerPedId()

function AddTestMenu(menu)
    local adder = NativeUI.CreateItem("Adder", "Appuie sur ENTRER pour faire apparaître une Adder.")
    menu:AddItem(adder)
    local blista = NativeUI.CreateItem("Blista", "Appuie sur ENTRER pour faire apparaître une Blista")
    menu:AddItem(blista)

    menu.OnItemSelect = function(_, item, index)
        if item == adder then
            spawnCar("adder")
            notify("Votre véhicule à spawn avec ~g~succès !")
            _menuPool:CloseAllMenus(true)
        end

        if item == blista then
            spawnCar("blista")
            notify("Votre véhicule à spawn avec ~g~succès !")
            _menuPool:CloseAllMenus(true)
        end
    end

    local carmenu = _menuPool:AddSubMenu(menu, "Voiture", "Une liste de voiture")
    local ninef = NativeUI.CreateItem("Ninef", "Appuie sur enter pour avoir une ninef")
    carmenu.SubMenu:AddItem(ninef)

    ninef.Activated = function(_, item, index)
        if item == ninef then
            spawnCar("ninef")
            notify("Votre véhicule à spawn avec ~g~succès !")
            _menuPool:CloseAllMenus(true)
        end
    end

    _menuPool:RefreshIndex()
end

AddTestMenu(mainMenu)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 57) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(xPlayer, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
end

-- script exemple
