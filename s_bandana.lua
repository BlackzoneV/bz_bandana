ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

itemler = {
	'aztecasbandana',
	'ballasbandana',
	'bloodsbandana',
	'greenbandana',
	'vagosbandana',
	'blackbandana'
}

ESX.RegisterServerCallback('bz:bandana', function(source, cb, target)

local xPlayer = ESX.GetPlayerFromId(target)
local yPlayer = ESX.GetPlayerFromId(source)

local data = {
	name = GetPlayerName(target),
	envanter = xPlayer.inventory
}

local itemyokla = false
for i=1, #itemler, 1 do
	local items = tostring(itemler[i])
	local bandanacheck = xPlayer.getInventoryItem(items).count
    if bandanacheck > 0 then
        itemyokla = true
		yPlayer.addInventoryItem(items, 1)
		xPlayer.removeInventoryItem(items, 1)
		Wait(100)
		yPlayer.removeInventoryItem(items, 1)
		TriggerClientEvent('notification', source, 'Helal bee, Takımına bir sayı daha yazdırdın!', 1)

		if items ~= 'ballasbandana' and (xPlayer.job.name == 'aztecas' or xPlayer.job.name == 'bloodz' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'vagos' or xPlayer.job.name == 'blackgang') and yPlayer.job.name == 'ballas'  then
			local arti = MySQL.Async.fetchScalar("SELECT ballas FROM bz_bandana", {}, function(ballas)
			if ballas then
			local ekle = json.decode(ballas)
			
			MySQL.Async.execute('UPDATE bz_bandana SET ballas=@ballas', {
			['@ballas'] = json.encode(ekle) + 1
			})
		
			end
			end)
		elseif items ~= 'aztecasbandana' and (xPlayer.job.name == 'ballas' or xPlayer.job.name == 'bloodz' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'vagos' or xPlayer.job.name == 'blackgang') and yPlayer.job.name == 'aztecas' then
			local arti = MySQL.Async.fetchScalar("SELECT aztecas FROM bz_bandana", {}, function(aztecas)
			if aztecas then
			local ekle = json.decode(aztecas)
			
			MySQL.Async.execute('UPDATE bz_bandana SET aztecas=@aztecas', {
			['@aztecas'] = json.encode(ekle) + 1
			})
		
			end
			end)
		elseif items ~= 'bloodsbandana' and (xPlayer.job.name == 'aztecas' or xPlayer.job.name == 'ballas' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'vagos' or xPlayer.job.name == 'blackgang') and yPlayer.job.name == 'bloodz' then
			local arti = MySQL.Async.fetchScalar("SELECT bloodz FROM bz_bandana", {}, function(bloodz)
			if bloodz then
			local ekle = json.decode(bloodz)
			
			MySQL.Async.execute('UPDATE bz_bandana SET bloodz=@bloodz', {
			['@bloodz'] = json.encode(ekle) + 1
			})
		
			end
			end)
		elseif items ~= 'greenbandana' and (xPlayer.job.name == 'aztecas' or xPlayer.job.name == 'ballas' or xPlayer.job.name == 'bloodz' or xPlayer.job.name == 'vagos' or xPlayer.job.name == 'blackgang') and yPlayer.job.name == 'grove' then
			local arti = MySQL.Async.fetchScalar("SELECT grove FROM bz_bandana", {}, function(grove)
			if grove then
			local ekle = json.decode(grove)
			
			MySQL.Async.execute('UPDATE bz_bandana SET grove=@grove', {
			['@grove'] = json.encode(ekle) + 1
			})
		
			end
			end)
		elseif items ~= 'vagosbandana' and (xPlayer.job.name == 'aztecas' or xPlayer.job.name == 'ballas' or xPlayer.job.name == 'bloodz' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'blackgang') and yPlayer.job.name == 'vagos' then
			local arti = MySQL.Async.fetchScalar("SELECT vagos FROM bz_bandana", {}, function(vagos)
			if vagos then
			local ekle = json.decode(vagos)
			
			MySQL.Async.execute('UPDATE bz_bandana SET vagos=@vagos', {
			['@vagos'] = json.encode(ekle) + 1
			})
		
			end
			end)
		elseif items ~= 'blackbandana' and (xPlayer.job.name == 'aztecas' or xPlayer.job.name == 'ballas' or xPlayer.job.name == 'bloodz' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'vagos') and yPlayer.job.name == 'blackgang' then
			local arti = MySQL.Async.fetchScalar("SELECT black FROM bz_bandana", {}, function(black)
			if black then
			local ekle = json.decode(black)
			
			MySQL.Async.execute('UPDATE bz_bandana SET black=@black', {
			['@black'] = json.encode(ekle) + 1
			})
		
			end
			end)
		end
		

		break
    end
end

if not itemyokla then
TriggerClientEvent('notification', source, 'Üzerinde bandanası yok!', 2)
end

cb(data)

end)

RegisterCommand('bandanalist', function(source)

local xPlayer = ESX.GetPlayerFromId(source)

MySQL.Async.fetchAll('SELECT * FROM bz_bandana', {}, function(ceteler)
if ceteler then
for i=1, #ceteler, 1 do
local ballas = json.decode(ceteler[i].ballas)
local vagos = json.decode(ceteler[i].vagos)
local bloodz = json.decode(ceteler[i].bloodz)
local grove = json.decode(ceteler[i].grove)
local aztecas = json.decode(ceteler[i].aztecas)
local black = json.decode(ceteler[i].black)

TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Aztecas Takımı ^1'..json.encode(aztecas)..'^0 bandana toplamış!')
TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Ballas Takımı ^1'..json.encode(ballas)..'^0 bandana toplamış!')
TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Bloodz Takımı ^1'..json.encode(bloodz)..'^0 bandana toplamış!')
TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Grove Takımı ^1'..json.encode(grove)..'^0 bandana toplamış!')
TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Vagos Takımı ^1'..json.encode(vagos)..'^0 bandana toplamış!')
TriggerClientEvent('chatMessage', xPlayer.source, '^0^*Black Takımı ^1'..json.encode(black)..'^0 bandana toplamış!')


end
end
end)

end)