;	BlitzSteam - Steam wrapper for Blitz
;	Copyright (C) 2015 Xaymar (Michael Fabian Dirks)
;
;	This program is free software: you can redistribute it and/or modify
;	it under the terms of the GNU Lesser General Public License as
;	published by the Free Software Foundation, either version 3 of the 
;	License, or (at your option) any later version.
;
;	This program is distributed in the hope that it will be useful,
;	but WITHOUT ANY WARRANTY; without even the implied warranty of
;	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;	GNU General Public License for more details.
;
;	You should have received a copy of the GNU Lesser General Public License
;	along with this program.  If not, see <http:;www.gnu.org/licenses/>.

.lib "BlitzSteam.dll"

; GameServerStats -------------------------------------------------------------
BS_SteamGameServerStats%()														:"_BS_SteamGameServerStats@0"
BS_ISteamGameServerStats_RequestUserStats%(pThis%, lSteamId%)					:"_BS_ISteamGameServerStats_RequestUserStats@8"
;! Function above returns a SteamAPICall_t*, clean it up afterwards!
BS_ISteamGameServerStats_StoreUserStats%(pThis%, lSteamId%)						:"_BS_ISteamGameServerStats_StoreUserStats@8"
;! Function above returns a SteamAPICall_t*, clean it up afterwards!
BS_ISteamGameServerStats_GetUserStat%(pThis%, lSteamId%, cName$, pData*)		:"_BS_ISteamGameServerStats_GetUserStat@16"
BS_ISteamGameServerStats_GetUserStatEx%(pThis%, lSteamId%, cName$, pData%)		:"_BS_ISteamGameServerStats_GetUserStat@16"
BS_ISteamGameServerStats_GetUserStatF%(pThis%, lSteamId%, cName$, pData*)		:"_BS_ISteamGameServerStats_GetUserStatF@16"
BS_ISteamGameServerStats_GetUserStatFEx%(pThis%, lSteamId%, cName$, pData%)		:"_BS_ISteamGameServerStats_GetUserStatF@16"
BS_ISteamGameServerStats_GetUserAchievement%(pThis%, lSteamId%, cName$, pbAchieved*):"_BS_ISteamGameServerStats_GetUserAchievement@16"
BS_ISteamGameServerStats_GetUserAchievementEx%(pThis%, lSteamId%, cName$, pbAchieved%):"_BS_ISteamGameServerStats_GetUserAchievement@16"
BS_ISteamGameServerStats_SetUserStat%(pThis%, lSteamId%, cName%, iData%)		:"_BS_ISteamGameServerStats_SetUserStat@16"
BS_ISteamGameServerStats_SetUserStatF%(pThis%, lSteamId%, cName%, fData#)		:"_BS_ISteamGameServerStats_SetUserStatF@16"
BS_ISteamGameServerStats_UpdateUserAvgRateStat%(pThis%, lSteamId%, cName$, fCountThisSession#, dSessionLength%):"_BS_ISteamGameServerStats_UpdateUserAvgRateStat@20"
;! Function above takes a Double* as last parameter.
BS_ISteamGameServerStats_SetUserAchievement%(pThis%, lSteamId%, cName$)			:"_BS_ISteamGameServerStats_SetUserAchievement@12"
BS_ISteamGameServerStats_ClearUserAchievement%(pThis%, lSteamId%, cName$)		:"_BS_ISteamGameServerStats_ClearUserAchievement@12"