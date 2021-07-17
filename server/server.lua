ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('stash:Remove')
AddEventHandler('stash:Remove', function()
local xPlayer = ESX.GetPlayerFromId(source)
local currentSafe = xPlayer.getInventoryItem("safe")["count"]
if currentSafe > 0 then
xPlayer.removeInventoryItem("safe", 1)
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Go buy a new safe', })
print("safe was deleted")
end
end)