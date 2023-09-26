ESX = nil

RegisterServerEvent('test_menu:eatBread')
AddEventHandler('test_menu:eatBread', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("bread", 1)
end)
