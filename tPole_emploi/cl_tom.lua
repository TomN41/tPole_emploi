ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

TomNMarker              = {}
TomNMarker.DrawDistance = 100
TomNMarker.Size         = {x = 0.7, y = 0.7, z = 0.7}
TomNMarker.Color        = {r = 255, g = 255, b = 255}
TomNMarker.Type         = 21

local position = {
    {x = -269.46,   y = -955.24,  z = 31.22 },
} 

RMenu.Add('tomn', 'main', RageUI.CreateMenu("Pôle Emploi", "Séléctionne votre Métier"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('tomn', 'main'), true, true, true, function()
            RageUI.Separator('Bienvenue ~b~'..GetPlayerName(PlayerId())) 
            RageUI.Separator("~c~↓ ~s~Métiers Intérimaires ~c~↓")
            RageUI.Button("Chantier", nil, {RightLabel = "~c~→→"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('TomN:EmploiChantier', police)
                end
            end)
        end, function()
        end)
        Citizen.Wait(0)

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -269.46, -955.24, 31.22)
            if dist <= 16.0 then
                DrawMarker(TomNMarker.Type, -269.46, -955.24, 31.22, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, TomNMarker.Size.x, TomNMarker.Size.y, TomNMarker.Size.z, TomNMarker.Color.r, TomNMarker.Color.g, TomNMarker.Color.b, 100, false, true, 2, false, false, false, false)
            end
            if dist <= 1.5 then
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour accéder au pôle emploi.")
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('tomn', 'main'), not RageUI.Visible(RMenu:Get('tomn', 'main')))
                end   
            end
        end
    end
end)

local blips = {
    {title="Pôle Emploi", colour=5, id=267, x = -269.37, y = -955.19, z = 30.25, scale=0.75}

}
Citizen.CreateThread(function()
for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, info.scale)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)


































print("TomN - C-host.fr >> Pole Emploi started.")