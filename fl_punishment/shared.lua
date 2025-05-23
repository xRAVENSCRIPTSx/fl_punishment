Config = {
	Locale = GetConvar("esx:locale", "en")
}
if not Translate then Translate = _ end

Config.ComservCommand = 'comserv'
Config.JailCommand = 'jail'
Config.PanelCommand = 'panel'
Config.EndComservCommand = 'endcomserv'
Config.EndJailCommand = 'endjail'
Config.BanCommand = 'flban'
Config.UnbanCommand = 'flunban'

COMSERV = {
	outCoords = {
		Enable = true,
		Coords = vector3(216.4828, -805.2026, 30.7855),
	},
	coords = vector3(-1143.5728, 22.1564, 50.1590),
	radius = 45,

	marker = { --task marker
		typ = 1,
		size = 1.5,
		upDown = false,
		color = { 200, 150, 0, 150 },
	},

	blip = {
		icon = 1,
		name = "Communtity Service",
	},

	model = GetHashKey("prop_tool_broom"),
}

JAIL = {
	cells = {
		vector3(-2487.8254, 2974.3013, 48.8845),
		vector3(-2480.9553, 2948.6926, 48.8551),
	},
	outCoords = vector3(216.4828, -805.2026, 30.7855),
	distance = 3,
}

ADMIN_RANKS = {
	["owner"] = true,
	["developer"] = true,
	["servermanager"] = true,
	["superadmin"] = true,
	["admin"] = true,
	["moderator"] = true
}

-- WEBHOOK = false --discord log is disabled
WEBHOOK = "YOUR_WEBHOOK_HERE" --your webhook here

function output(text, target)
	if IsDuplicityVersion() then --Server Side
		TriggerClientEvent('codem-notification:Create', target, text, 'warning', Locales.en.notify_1, 5000) --Change the .en. to your chosen langlauge
	else
		TriggerClientEvent('codem-notification:Create', target, text, 'warning', Locales.en.notify_1, 5000) --Change the .en. to your chosen langlauge
	end
end

if not IsDuplicityVersion() then --Server side
	return
end

function isAdmin(xPlayer)
	if type(xPlayer) ~= "table" then
		xPlayer = ESX.GetPlayerFromId(xPlayer)
	end

	if not xPlayer then
		return false
	end

	local permissions = ADMIN_RANKS[xPlayer.getGroup()]

	if not permissions then
		output(Translate("not_admin"), xPlayer.source)
	end

	return permissions
end
