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
; BlitzCallback ---------------------------------------------------------------
BS_Callback_New%(pFunction%)													:"_BS_Callback_New@4"
BS_Callback_Destroy(pThis%)														:"_BS_Callback_Destroy@4"
BS_Callback_GetCallbackSizeBytes%(pThis%)										:"_BS_Callback_GetCallbackSizeBytes@4"
BS_Callback_SetCallback(pThis%, iCallback%)										:"_BS_Callback_SetCallback@8"
BS_Callback_GetCallback%(pThis%)												:"_BS_Callback_GetCallback@4"
BS_Callback_SetFunction(pThis%, pFunction%)										:"_BS_Callback_SetFunction@8"
BS_Callback_GetFunction%(pThis%)												:"_BS_Callback_GetFunction@4"
BS_Callback_SetRegistered(pThis%, bIsRegistered%)								:"_BS_Callback_SetRegistered@8"
BS_Callback_IsRegistered%(pThis%)												:"_BS_Callback_IsRegistered@4"
BS_Callback_SetGameServer(pThis%, bIsGameServer%)								:"_BS_Callback_SetGameServer@8"
BS_Callback_IsGameServer%(pThis%)												:"_BS_Callback_IsGameServer@4"
BS_Callback_Register(pThis%, iCallback%)										:"_BS_Callback_Register@8"
BS_Callback_Unregister(pThis%)													:"_BS_Callback_Unregister@4"
BS_Callback_RegisterResult(pThis%, lSteamAPICall%, iCallback%)					:"_BS_Callback_RegisterResult@12"
BS_Callback_UnregisterResult(pThis%)											:"_BS_Callback_UnregisterResult@4"