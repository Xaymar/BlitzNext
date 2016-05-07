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

; ISteamMatchmakingServerListResponse -----------------------------------------
BS_ISteamMatchmakingServerListResponse_New%(Data%, pServerResponded%, pServerFailedToRespond%, pRefreshComplete%):"_BS_ISteamMatchmakingServerListResponse_New@16"
BS_ISteamMatchmakingServerListResponse_Destroy%(pThis%):"_BS_ISteamMatchmakingServerListResponse_Destroy@4"
;- Callback pServerResponded: Function(Data%, hRequest%, iServer%)
;- Callback pServerFailedToRespond: Function(Data%, hRequest%, iServer%)
;- Callback pRefreshComplete: Function(Data%)

; ISteamMatchmakingPingResponse -----------------------------------------------
BS_ISteamMatchmakingPingResponse_New%(Data%, pServerResponded%, pServerFailedToRespond%):"_BS_ISteamMatchmakingPingResponse_New@12"
BS_ISteamMatchmakingPingResponse_Destroy%(pThis%):"_BS_ISteamMatchmakingPingResponse_Destroy@4"
;- Callback pServerResponded: Function(Data%, TGameServerItem%)
;- Callback pServerFailedToRespond: Function(Data%)

; ISteamMatchmakingPlayersResponse --------------------------------------------
BS_ISteamMatchmakingPlayersResponse_New%(Data%, pAddPlayerToList%, pPlayersFailedToRespond%, pPlayersRefreshComplete%):"_BS_ISteamMatchmakingPlayersResponse_New@16"
BS_ISteamMatchmakingPlayersResponse_Destroy%(pThis%):"_BS_ISteamMatchmakingPlayersResponse_Destroy@4"
;- Callback pAddPlayerToList: Function(Data%, pchName%, nScore%, flTimePlayer#)
;- Callback pPlayersFailedToRespond: Function(Data%)
;- Callback pPlayersRefreshComplete: Function(Data%)

; ISteamMatchmakingRulesResponse ----------------------------------------------
BS_ISteamMatchmakingRulesResponse_New%(Data%, pRulesResponded%, pRulesFailedToRespond%, pRulesRefreshComplete%):"_BS_ISteamMatchmakingRulesResponse_New@16"
BS_ISteamMatchmakingRulesResponse_Destroy%(pThis%):"_BS_ISteamMatchmakingPlayersResponse_Destroy@4"
;- Callback pRulesResponded: Function(Data%, pchRule%, pchValue%)
;- Callback pRulesFailedToRespond: Function(Data%)
;- Callback pRulesRefreshComplete: Function(Data%)

; TGameServerItem -------------------------------------------------------------
BS_TGameServerItem_GetName$(pThis%)												:"_BS_TGameServerItem_GetName@4"
BS_TGameServerItem_SetName(pThis%, cName$)										:"_BS_TGameServerItem_SetName@8"
BS_TGameServerItem_NetAdr%(pThis%)												:"_BS_TGameServerItem_NetAdr@4"
BS_TGameServerItem_Ping%(pThis%)												:"_BS_TGameServerItem_Ping@4"
BS_TGameServerItem_HadSuccessfulResponse%(pThis%)								:"_BS_TGameServerItem_HadSuccessfulResponse@4"
BS_TGameServerItem_DoNotRefresh%(pThis%)										:"_BS_TGameServerItem_DoNotRefresh@4"
BS_TGameServerItem_GameDir$(pThis%)												:"_BS_TGameServerItem_GameDir@4"
BS_TGameServerItem_Map$(pThis%)													:"_BS_TGameServerItem_Map@4"
BS_TGameServerItem_GameDescription$(pThis%)										:"_BS_TGameServerItem_GameDescription@4"
BS_TGameServerItem_AppId%(pThis%)												:"_BS_TGameServerItem_AppId@4"
BS_TGameServerItem_Players%(pThis%)												:"_BS_TGameServerItem_Players@4"
BS_TGameServerItem_MaxPlayers%(pThis%)											:"_BS_TGameServerItem_MaxPlayers@4"
BS_TGameServerItem_BotPlayers%(pThis%)											:"_BS_TGameServerItem_BotPlayers@4"
BS_TGameServerItem_Password%(pThis%)											:"_BS_TGameServerItem_Password@4"
BS_TGameServerItem_Secure%(pThis%)												:"_BS_TGameServerItem_Secure@4"
BS_TGameServerItem_TimeLastPlayed%(pThis%)										:"_BS_TGameServerItem_TimeLastPlayed@4"
BS_TGameServerItem_ServerVersion%(pThis%)										:"_BS_TGameServerItem_ServerVersion@4"
BS_TGameServerItem_GameTags$(pThis%)											:"_BS_TGameServerItem_GameTags@4"
BS_TGameServerItem_SteamID%(pThis%)												:"_BS_TGameServerItem_SteamID@4"

; TServerNetAdr ---------------------------------------------------------------
BS_TServerNetAdr_Set(pThis%, pThat%)											:"_BS_TServerNetAdr_Set@8"
BS_TServerNetAdr_Init(pThis%, iIP%, iQueryPort%, iConnectionPort%)				:"_BS_TServerNetAdr_Init@16"
BS_TServerNetAdr_GetQueryPort%(pThis%)											:"_BS_TServerNetAdr_GetQueryPort@4"
BS_TServerNetAdr_SetQueryPort(pThis%, iPort%)									:"_BS_TServerNetAdr_SetQueryPort@8"
BS_TServerNetAdr_GetConnectionPort%(pThis%)										:"_BS_TServerNetAdr_GetConnectionPort@4"
BS_TServerNetAdr_SetConnectionPort(pThis%, iPort%)								:"_BS_TServerNetAdr_SetConnectionPort@8"
BS_TServerNetAdr_GetIP%(pThis%)													:"_BS_TServerNetAdr_GetIP@4"
BS_TServerNetAdr_SetIP(pThis%, iIP%)											:"_BS_TServerNetAdr_SetIP@8"
BS_TServerNetAdr_GetConnectionAddressString$(pThis%)							:"_BS_TServerNetAdr_GetConnectionAddressString@4"
BS_TServerNetAdr_GetQueryAddressString$(pThis%)									:"_BS_TServerNetAdr_GetQueryAddressString@4"
BS_TServerNetAdr_Compare%(pThis%, pThat%)										:"_BS_TServerNetAdr_Compare@8"