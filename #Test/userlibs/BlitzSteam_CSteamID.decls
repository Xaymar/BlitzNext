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
; CSteamID --------------------------------------------------------------------
BS_CSteamID_New%()																:"_BS_CSteamID_New@0"
BS_CSteamID_Copy%(pThis%)														:"_BS_CSteamID_Copy@4"
BS_CSteamID_Destroy(pThis%)														:"_BS_CSteamID_Destroy@4"
BS_CSteamID_New_IdUniverseType%(iAccountId%, EUniverse%, EAccountType%)			:"_BS_CSteamID_New_IdUniverseType@12"
BS_CSteamID_New_IdInstanceUniverseType%(iAccountId%, iInstance%, EUniverse%, EAccountType%):"_BS_CSteamID_New_IdInstanceUniverseType@16"
BS_CSteamID_FromL%(pOther%)														:"_BS_CSteamID_FromL@4"
BS_CSteamID_ToL%(pThis%)														:"_BS_CSteamID_ToL@4"
BS_CSteamID_Set(pThis%, iAccountId%, EUniverse%, EAccountType%)					:"_BS_CSteamID_Set@16"
BS_CSteamID_InstancedSet(pThis%, iAccountId%, iInstance%, EUniverse%, EAccountType%):"_BS_CSteamID_InstancedSet@20"
BS_CSteamID_FullSet(pThis%, plIdentifier%, EUniverse%, EAccountType%)			:"_BS_CSteamID_FullSet@16"
BS_CSteamID_SetFromLong(pthis%, plSteamID%)										:"_BS_CSteamID_SetFromLong@8"
BS_CSteamID_Clear(pThis%)														:"_BS_CSteamID_Clear@4"
BS_CSteamID_GetStaticAccountKey%(pThis%)										:"_BS_CSteamID_GetStaticAccountKey@4"
BS_CSteamID_CreateBlankAnonLogon(pThis%, EUniverse%)							:"_BS_CSteamID_CreateBlankAnonLogon@8"
BS_CSteamID_CreateBlankAnonUserLogon(pThis%, EUniverse%)						:"_BS_CSteamID_CreateBlankAnonUserLogon@8"
BS_CSteamID_IsBlankAnonAccount%(pThis%)											:"_BS_CSteamID_IsBlankAnonAccount@4"
BS_CSteamID_IsGameServerAccount%(pThis%)										:"_BS_CSteamID_IsGameServerAccount@4"
BS_CSteamID_IsPersistentGameServerAccount%(pThis%)								:"_BS_CSteamID_IsPersistentGameServerAccount@4"
BS_CSteamID_IsAnonGameServerAccount%(pThis%)									:"_BS_CSteamID_IsAnonGameServerAccount@4"
BS_CSteamID_IsContentServerAccount%(pThis%)										:"_BS_CSteamID_IsContentServerAccount@4"
BS_CSteamID_IsClanAccount%(pThis%)												:"_BS_CSteamID_IsClanAccount@4"
BS_CSteamID_IsChatAccount%(pThis%)												:"_BS_CSteamID_IsChatAccount@4"
BS_CSteamID_IsLobby%(pThis%)													:"_BS_CSteamID_IsLobby@4"
BS_CSteamID_IsIndividualAccount%(pThis%)										:"_BS_CSteamID_IsIndividualAccount@4"
BS_CSteamID_IsAnonAccount%(pThis%)												:"_BS_CSteamID_IsAnonAccount@4"
BS_CSteamID_IsAnonUserAccount%(pThis%)											:"_BS_CSteamID_IsAnonUserAccount@4"
BS_CSteamID_IsConsoleUserAccount%(pThis%)										:"_BS_CSteamID_IsConsoleUserAccount@4"
BS_CSteamID_SetAccountID(pThis%, iAccountId%)									:"_BS_CSteamID_SetAccountID@8"
BS_CSteamID_GetAccountID%(pThis%)												:"_BS_CSteamID_GetAccountID@4"
BS_CSteamID_SetAccountInstance(pThis%, iInstance%)								:"_BS_CSteamID_SetAccountInstance@8"
BS_CSteamID_ClearIndividualInstance(pThis%)										:"_BS_CSteamID_ClearIndividualInstance@4"
BS_CSteamID_HasNoIndividualInstance%(pThis%)									:"_BS_CSteamID_HasNoIndividualInstance@4"
BS_CSteamID_GetAccountInstance%(pThis%)											:"_BS_CSteamID_GetAccountInstance@4"
BS_CSteamID_GetEAccountType%(pThis%)											:"_BS_CSteamID_GetEAccountType@4"
BS_CSteamID_SetEUniverse%(pThis%, EUniverse%)									:"_BS_CSteamID_SetEUniverse@8"
BS_CSteamID_GetEUniverse%(pThis%)												:"_BS_CSteamID_GetEUniverse@4"
BS_CSteamID_Compare%(pThis%, pOther%)											:"_BS_CSteamID_Compare@8"