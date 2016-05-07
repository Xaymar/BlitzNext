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

; Apps ------------------------------------------------------------------------
BS_SteamApps%()																	:"_BS_SteamApps@0"
BS_ISteamApps_IsSubscribed%(pThis%)												:"_BS_ISteamApps_IsSubscribed@4"
BS_ISteamApps_IsLowViolence%(pThis%)											:"_BS_ISteamApps_IsLowViolence@4"
BS_ISteamApps_IsCybercafe%(pThis%)												:"_BS_ISteamApps_IsCybercafe@4"
BS_ISteamApps_IsVACBanned%(pThis%)												:"_BS_ISteamApps_IsVACBanned@4"
BS_ISteamApps_GetCurrentGameLanguage$(pThis%)									:"_BS_ISteamApps_GetCurrentGameLanguage@4"
BS_ISteamApps_GetAvailableGameLanguages$(pThis%)								:"_BS_ISteamApps_GetAvailableGameLanguages@4"
BS_ISteamApps_IsSubscribedApp%(pThis%, iAppId%)									:"_BS_ISteamApps_IsSubscribedApp@8"
BS_ISteamApps_IsDlcInstalled%(pThis%, iAppId%)									:"_BS_ISteamApps_IsDlcInstalled@8"
BS_ISteamApps_GetEarliestPurchaseUnixTime%(pThis%, iAppId%)						:"_BS_ISteamApps_GetEarliestPurchaseUnixTime@8"
BS_ISteamApps_IsSubscribedFromFreeWeekend%(pThis%)								:"_BS_ISteamApps_IsSubscribedFromFreeWeekend@4"
BS_ISteamApps_GetDLCCount%(pThis%)												:"_BS_ISteamApps_GetDLCCount@4"
BS_ISteamApps_GetDLCDataByIndex%(pThis%, iDLC%, pAppId*, pAvailable*, pName*, iNameSize%):"_BS_ISteamApps_GetDLCDataByIndex@24"
BS_ISteamApps_GetDLCDataByIndexEx%(pThis%, iDLC%, pAppId%, pAvailable%, pName%, iNameSize%):"_BS_ISteamApps_GetDLCDataByIndex@24"
BS_ISteamApps_InstallDLC(pThis%, iAppId%)										:"_BS_ISteamApps_InstallDLC@8"
BS_ISteamApps_UninstallDLC(pThis%, iAppId%)										:"_BS_ISteamApps_UninstallDLC@8"
BS_ISteamApps_RequestAppProofOfPurchaseKey(pThis%, iAppId%)						:"_BS_ISteamApps_RequestAppProofOfPurchaseKey@8"
BS_ISteamApps_GetCurrentBetaName%(pThis%, pName*, iNameSize%)					:"_BS_ISteamApps_GetCurrentBetaName@12"
BS_ISteamApps_GetCurrentBetaNameEx%(pThis%, pName%, iNameSize%)					:"_BS_ISteamApps_GetCurrentBetaName@12"
BS_ISteamApps_MarkContentCorrupt%(pThis%, bMissingFilesOnly%)					:"_BS_ISteamApps_MarkContentCorrupt@8"
BS_ISteamApps_GetInstalledDepots%(pThis%, iAppId%, pDepots*, iMaxDepots%)		:"_BS_ISteamApps_GetInstalledDepots@16"
BS_ISteamApps_GetInstalledDepotsEx%(pThis%, iAppId%, pDepots%, iMaxDepots%)		:"_BS_ISteamApps_GetInstalledDepots@16"
BS_ISteamApps_GetAppInstallDir%(pThis%, iAppId%, pPathBuffer*, iPathBufferSize%):"_BS_ISteamApps_GetAppInstallDir@16"
BS_ISteamApps_GetAppInstallDirEx%(pThis%, iAppId%, pPathBuffer%, iPathBufferSize%):"_BS_ISteamApps_GetAppInstallDir@16"
BS_ISteamApps_IsAppInstalled%(pThis%, iAppId%)									:"_BS_ISteamApps_IsAppInstalled@8"
BS_ISteamApps_GetAppOwner%(pThis%)												:"_BS_ISteamApps_GetAppOwner@4"
BS_ISteamApps_GetLaunchQueryParam$(pThis%, cKey$)								:"_BS_ISteamApps_GetLaunchQueryParam@8"
BS_ISteamApps_GetDlcDownloadProgress%(pThis%, iAppId%, llDownloaded*, llTotal*)	:"_BS_ISteamApps_GetDlcDownloadProgress@16"
BS_ISteamApps_GetDlcDownloadProgressEx%(pThis%, iAppId%, llDownloaded%, llTotal%):"_BS_ISteamApps_GetDlcDownloadProgress@16"
BS_ISteamApps_GetAppBuildId%(pThis%)											:"_BS_ISteamApps_GetAppBuildId@4"