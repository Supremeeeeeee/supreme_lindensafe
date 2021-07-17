# supreme_lindensafe
Safe detotnate system





Just a small script that creates an object (crate) calls on linden's inventory stash. It's scripted to detotnate and explode after 2 minutes (configurable) it could be useful for someone out there, if you place your stash down but dont use it then your item remains in your inventory but as soon as you enter the stash it gets removed from your inventory but items remain. If you dont wish for the item to be removed at all then delete the server file, update the manifest file and comment out line " TriggerServerEvent("stash:Remove", args) -- Removes Safe Item From Inventory " Use's bt-target to utilize the stash on the object so that is a requirement.


# requirements
linden_inventory - https://github.com/thelindat/linden_inventory (manditory)<br/>
bt-target - NomsFork - https://forum.cfx.re/t/bt-target-forked-updated-functionality/3881443 (manditory)<br/>
go to linden_inventory - goto - shared/items.lua and add in an item called 'safe' (manditory)

video preview

https://streamable.com/pjhqbq

# upcoming udates
- Animation when safe gets put down on ground
