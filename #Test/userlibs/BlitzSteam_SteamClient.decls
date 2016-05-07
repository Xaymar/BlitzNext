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

; Client ----------------------------------------------------------------------
BS_SteamClient%()																:"_BS_SteamClient@0"
BS_ISteamClient_CreateSteamPipe%(pThis%)										:"_BS_ISteamClient_CreateSteamPipe@4"
BS_ISteamClient_ReleaseSteamPipe%(pThis%, hPipe%)								:"_BS_ISteamClient_ReleaseSteamPipe@8"
BS_ISteamClient_ConnectToGlobalUser%(pThis%, hPipe%)							:"_BS_ISteamClient_ConnectToGlobalUser@8"
BS_ISteamClient_SetLocalIPBinding(pThis, unIP%, usPort%)						:"_BS_ISteamClient_SetLocalIPBinding@12"
BS_ISteamClient_CreateLocalUser%(pThis%, pSteamPipe%, EAccountType%)			:"_BS_ISteamClient_CreateLocalUser@12"
BS_ISteamClient_ReleaseUser(pThis%, hPipe%, hUser%)								:"_BS_ISteamClient_ReleaseUser@12"
BS_ISteamClient_GetIPCCallCount%(pThis%)										:"_BS_ISteamClient_GetIPCCallCount@4"
BS_ISteamClient_ShutdownIfAllPipesClosed%(pThis%)								:"_BS_ISteamClient_ShutdownIfAllPipesClosed@4"
BS_ISteamClient_GetSteamAppList%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamAppList@16"
BS_ISteamClient_GetSteamApps%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamApps@16"
BS_ISteamClient_GetSteamController%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamController@16"
BS_ISteamClient_GetSteamFriends%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamFriends@16"
BS_ISteamClient_GetSteamGameServer%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamGameServer@16"
BS_ISteamClient_GetSteamGameServerStats%(pThis%, hUser%, hPipe%, cVersion$)		:"_BS_ISteamClient_GetSteamGameServerStats@16"
BS_ISteamClient_GetSteamHTMLSurface%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamHTMLSurface@16"
BS_ISteamClient_GetSteamHTTP%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamHTTP@16"
BS_ISteamClient_GetSteamInventory%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamInventory@16"
BS_ISteamClient_GetSteamMatchmaking%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamMatchmaking@16"
BS_ISteamClient_GetSteamMatchmakingServers%(pThis%, hUser%, hPipe%, cVersion$)	:"_BS_ISteamClient_GetSteamMatchmakingServers@16"
BS_ISteamClient_GetSteamMusic%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamMusic@16"
BS_ISteamClient_GetSteamMusicRemote%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamMusicRemote@16"
BS_ISteamClient_GetSteamNetworking%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamNetworking@16"
BS_ISteamClient_GetSteamRemoteStorage%(pThis%, hUser%, hPipe%, cVersion$)		:"_BS_ISteamClient_GetSteamRemoteStorage@16"
BS_ISteamClient_GetSteamScreenshots%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamScreenshots@16"
BS_ISteamClient_GetSteamUGC%(pThis%, hUser%, hPipe%, cVersion$)					:"_BS_ISteamClient_GetSteamUGC@16"
BS_ISteamClient_GetSteamUnifiedMessages%(pThis%, hUser%, hPipe%, cVersion$)		:"_BS_ISteamClient_GetSteamUnifiedMessages@16"
BS_ISteamClient_GetSteamUser%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamUser@16"
BS_ISteamClient_GetSteamUserStats%(pThis%, hUser%, hPipe%, cVersion$)			:"_BS_ISteamClient_GetSteamUserStats@16"
BS_ISteamClient_GetSteamUtils%(pThis%, hPipe%, cVersion$)						:"_BS_ISteamClient_GetSteamUtils@12"
BS_ISteamClient_GetSteamVideo%(pThis%, hUser%, hPipe%, cVersion$)				:"_BS_ISteamClient_GetSteamVideo@16"
BS_ISteamClient_SetWarningMessageHook(pThis%, pFunction%)						:"_BS_ISteamClient_SetWarningMessageHook@8"