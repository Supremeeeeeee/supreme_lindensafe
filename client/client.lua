-- Created by DuncanEll (SUPREME)
-- Clientside

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('supreme_lindenstash:safe')

AddEventHandler('supreme_lindenstash:safe', function()

    exports['mythic_progbar']:Progress({
        name = "unique_action_name",
        duration = 5000,
        label = 'Putting safe box down...',
        useWhileDead = true,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@prop_human_bum_bin@base",
            anim = "base",
        },
    })
    Citizen.Wait(5000)
    Wait(0)
    if not DoesEntityExist(ped) then
        ped = PlayerPedId()
    end

    ClearPedTasks(ped)

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

	local HashKey = GetHashKey("prop_box_ammo06a")

	local SpawnObject = CreateObject(HashKey, x, y, z-1)

	PlaceObjectOnGroundProperly(SpawnObject)

exports['mythic_notify']:SendAlert('inform', 'Safe will detonate in 2 minutes.')
        Wait(math.ceil(60000)) --Time for the safe to delete
exports['mythic_notify']:SendAlert('inform', 'Safe will detonate in 1 minute.')
        Wait(math.ceil(50000)) --Time for the safe to delete
exports['mythic_notify']:SendAlert('inform', 'Safe will detonate in 10 seconds.')
        Wait(math.ceil(10000)) --Time for the safe to delete

AddExplosion(x, y, z-1, 2, 0.3, false, false, false) 
	
DeleteObject(SpawnObject)
exports['mythic_notify']:SendAlert('success', 'Your safe detonated!')

end)

--function notification(msg)
--	SetNotificationTextEntry("STRING")
--	AddTextComponentString(msg)
--	DrawNotification(false, false)
--end


local safes = {

    1824078756,

}

exports['bt-target']:AddTargetModel(safes, {

    options = {

        {

            event = "stashSafe",

            icon = "fas fa-lock",

            label = "Open Your Safe",

        }

    },

    distance = 2.5

})

-- Opens Stash

RegisterNetEvent("stashSafe")
AddEventHandler("stashSafe", function()
TriggerServerEvent("stash:Remove", args) -- Removes Safe Item From Inventory
exports['linden_inventory']:OpenStash({ id = 'Safe', slots = 20, owner = ESX.GetPlayerData().identifier})
end)


