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

; GameServer ------------------------------------------------------------------
BS_SteamGameServer_Init%(iIP%, sSteamPort%, sGamePort%, sQueryPort%, EServerMode%, cVersion$):"_BS_SteamGameServer_Init@24"
BS_SteamGameServer_Shutdown()													:"_BS_SteamGameServer_Shutdown@0"
BS_SteamGameServer_RunCallbacks()												:"_BS_SteamGameServer_RunCallbacks@0"
BS_SteamGameServer_GetHSteamPipe%()												:"_BS_SteamGameServer_GetHSteamPipe@0"
BS_SteamGameServer_IsSecure%()													:"_BS_SteamGameServer_IsSecure@0"
BS_SteamGameServer_GetSteamID%()												:"_BS_SteamGameServer_GetSteamID@0"
;! Function above returns a CSteamID*, clean it up afterwards!
BS_SteamGameServer%()															:"_BS_SteamGameServer@0"
BS_ISteamGameServer_InitGameServer%(pThis%, iIP%, sGamePort%, sQueryPort%, iFlags%, iAppId%, cVersion$):"_BS_ISteamGameServer_InitGameServer@24"
BS_ISteamGameServer_SetProduct(pThis%, cProduct$)								:"_BS_ISteamGameServer_SetProduct@8"
BS_ISteamGameServer_SetGameDescription(pThis%, cDescription$)					:"_BS_ISteamGameServer_SetGameDescription@8"
BS_ISteamGameServer_SetModDir(pThis%, cDirectory$)								:"_BS_ISteamGameServer_SetModDir@8"
BS_ISteamGameServer_SetDedicatedServer(pThis%, bDedicated%)						:"_BS_ISteamGameServer_SetDedicatedServer@8"
BS_ISteamGameServer_LogOn(pThis%, cToken$)										:"_BS_ISteamGameServer_LogOn@8"
BS_ISteamGameServer_LogOnAnonymous(pThis%)										:"_BS_ISteamGameServer_LogOnAnonymous@4"
BS_ISteamGameServer_LogOff(pThis%)												:"_BS_ISteamGameServer_LogOff@4"
BS_ISteamGameServer_IsLoggedOn%(pThis%)											:"_BS_ISteamGameServer_IsLoggedOn@4"
BS_ISteamGameServer_IsSecure%(pThis%)											:"_BS_ISteamGameServer_IsSecure@4"
BS_ISteamGameServer_GetSteamID%(pThis%)											:"_BS_ISteamGameServer_GetSteamID@4"
BS_ISteamGameServer_WasRestartRequested%(pThis%)								:"_BS_ISteamGameServer_WasRestartRequested@4"
BS_ISteamGameServer_SetMaxPlayerCount(pThis%, iMaxPlayers%)						:"_BS_ISteamGameServer_SetMaxPlayerCount@8"
BS_ISteamGameServer_SetBotPlayerCount(pThis%, iBotPlayers%)						:"_BS_ISteamGameServer_SetBotPlayerCount@8"
BS_ISteamGameServer_SetServerName(pThis%, cName$)								:"_BS_ISteamGameServer_SetServerName@8"
BS_ISteamGameServer_SetMapName(pThis%, cName$)									:"_BS_ISteamGameServer_SetMapName@8"
BS_ISteamGameServer_SetPasswordProtected(pThis%, bPassworded%)					:"_BS_ISteamGameServer_SetPasswordProtected@8"
BS_ISteamGameServer_SetSpectatorPort(pThis%, sPort%)							:"_BS_ISteamGameServer_SetSpectatorPort@8"
BS_ISteamGameServer_SetSpectatorServerName(pThis%, cName$)						:"_BS_ISteamGameServer_SetSpectatorServerName@8"
BS_ISteamGameServer_ClearAllKeyValues(pThis%)									:"_BS_ISteamGameServer_ClearAllKeyValues@4"
BS_ISteamGameServer_SetKeyValue(pThis%, cKey$, cValue$)							:"_BS_ISteamGameServer_SetKeyValue@12"
BS_ISteamGameServer_SetGameTags(pThis%, cTags$)									:"_BS_ISteamGameServer_SetGameTags@8"
BS_ISteamGameServer_SetGameData(pThis%, cData$)									:"_BS_ISteamGameServer_SetGameData@8"
BS_ISteamGameServer_SetRegion(pThis%, cRegion$)									:"_BS_ISteamGameServer_SetRegion@8"
BS_ISteamGameServer_SendUserConnectAndAuthenticate%(pThis%, iIP%, pAuthBlob*, iAuthBlobSize%, lSteamId%):"_BS_ISteamGameServer_SendUserConnectAndAuthenticate@20"
BS_ISteamGameServer_SendUserConnectAndAuthenticateEx%(pThis%, iIP%, pAuthBlob%, iAuthBlobSize%, lSteamId%):"_BS_ISteamGameServer_SendUserConnectAndAuthenticate@20"
BS_ISteamGameServer_CreateUnauthenticatedUserConnection%(pThis%)				:"_BS_ISteamGameServer_CreateUnauthenticatedUserConnection@4"
;! Function above returns a CSteamID*, clean it up afterwards!
BS_ISteamGameServer_SendUserDisconnect(pThis%, lSteamId%)						:"_BS_ISteamGameServer_SendUserDisconnect@8"
BS_ISteamGameServer_UpdateUserData%(pThis%, lSteamId%, cName$, iScore%):"_BS_ISteamGameServer_UpdateUserData@16"
BS_ISteamGameServer_GetAuthSessionTicket%(pThis%, pTicket*, iTicketSize%, piTicketSize*):"_BS_ISteamGameServer_GetAuthSessionTicket@16"
BS_ISteamGameServer_GetAuthSessionTicketEx%(pThis%, pTicket%, iTicketSize%, piTicketSize%):"_BS_ISteamGameServer_GetAuthSessionTicket@16"
BS_ISteamGameServer_BeginAuthSession%(pThis%, pTicket*, iTicketSize%, lSteamId%):"_BS_ISteamGameServer_BeginAuthSession@16"
BS_ISteamGameServer_BeginAuthSessionEx%(pThis%, pTicket%, iTicketSize%, lSteamId%):"_BS_ISteamGameServer_BeginAuthSession@16"
BS_ISteamGameServer_EndAuthSession(pThis%, lSteamId%)							:"_BS_ISteamGameServer_EndAuthSession@8"
BS_ISteamGameServer_CancelAuthTicket(pThis%, iAuthTicket%)						:"_BS_ISteamGameServer_CancelAuthTicket@8"
BS_ISteamGameServer_UserHasLicenseForApp%(pThis%, lSteamId%, iAppId%)			:"_BS_ISteamGameServer_UserHasLicenseForApp@12"
BS_ISteamGameServer_RequestUserGroupStatus%(pThis%, lSteamId%, pSteamIdGroup%)	:"_BS_ISteamGameServer_RequestUserGroupStatus@12"
BS_ISteamGameServer_GetPublicIP%(pThis%)										:"_BS_ISteamGameServer_GetPublicIP@4"
BS_ISteamGameServer_HandleIncomingPacket%(pThis%, pBuffer*, iBufferSize%, iIP%, sPort%):"_BS_ISteamGameServer_HandleIncomingPacket@20"
BS_ISteamGameServer_HandleIncomingPacketEx%(pThis%, pBuffer%, iBufferSize%, iIP%, sPort%):"_BS_ISteamGameServer_HandleIncomingPacket@20"
BS_ISteamGameServer_GetNextOutgoingPacket%(pThis%, pBuffer*, iBufferSize%, piIP*, psPort*):"_BS_ISteamGameServer_GetNextOutgoingPacket@20"
BS_ISteamGameServer_GetNextOutgoingPacketEx%(pThis%, pBuffer%, iBufferSize%, piIP%, psPort%):"_BS_ISteamGameServer_GetNextOutgoingPacket@20"
BS_ISteamGameServer_EnableHeartbeats(pThis%, bActive%)							:"_BS_ISteamGameServer_EnableHeartbeats@8"
BS_ISteamGameServer_SetHeartbeatInterval(pThis%, iInterval%)					:"_BS_ISteamGameServer_SetHeartbeatInterval@8"
BS_ISteamGameServer_ForceHeartbeat(pThis%)										:"_BS_ISteamGameServer_ForceHeartbeat@4"
BS_ISteamGameServer_AssociateWithClan%(pThis%, pSteamIDClan%)					:"_BS_ISteamGameServer_AssociateWithClan@8"
;! Function above returns a SteamAPICall_t*, clean it up afterwards!
BS_ISteamGameServer_ComputeNewPlayerCompatibility%(pThis%, pSteamIDNewPlayer%)	:"_BS_ISteamGameServer_ComputeNewPlayerCompatibility@8"
;! Function above returns a SteamAPICall_t*, clean it up afterwards!
