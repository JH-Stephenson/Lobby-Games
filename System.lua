--Lobby Games System

--Services
local Players = game:GetService("Players")

--SystemTables
local ServerTable = {}
local PlayerTable = {}

--SystemFunctions

--CleanPlayerTable

--CleanTable
local function EndRound()
    table.clear(PlayerTable)
end

--RemovePlayerFromTable
local function RemovePlayerFromGame(Player)
    --Iterate, Find Player and Remove
    for _, TablePlayer in PlayerTable do
        if TablePlayer == Player then
            table.remove(PlayerTable, TablePlayer)
        end
    end
end

--AddPlayersToTable
local function StartRound()
    PlayerTable = unpack(ServerTable)
end

--SystemEvents
Players.PlayerAdded:Connect(function(Player)
    --AddPlayerToTable
    table.insert(ServerTable, Player)
end)

Players.PlayerRemoving:Connect(function(Player)
    --Iterate, Find Player and Remove
    for _, TablePlayer in ServerTable do
        if TablePlayer == Player then
            table.remove(ServerTable, TablePlayer)
        end
    end
end)