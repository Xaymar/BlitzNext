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

; AppList ---------------------------------------------------------------------
BS_SteamAppList%()																:"_BS_SteamAppList@0"
BS_ISteamAppList_GetNumInstalledApps%(pThis%)									:"_BS_ISteamAppList_GetNumInstalledApps@4"
BS_ISteamAppList_GetInstalledApps%(pThis%, pAppIdBuffer*, iMaxIDs%)				:"_BS_ISteamAppList_GetInstalledApps@12"
BS_ISteamAppList_GetInstalledAppsEx%(pThis%, pAppIdBuffer%, iMaxIDs%)			:"_BS_ISteamAppList_GetInstalledApps@12"
BS_ISteamAppList_GetAppName%(pThis%, iAppId%, pNameBuffer*, iNameMax%)			:"_BS_ISteamAppList_GetAppName@12"
BS_ISteamAppList_GetAppNameEx%(pThis%, iAppId%, pNameBuffer%, iNameMax%)		:"_BS_ISteamAppList_GetAppName@12"
BS_ISteamAppList_GetAppInstallDir%(pThis%, iAppId%, pPathBuffer*, iPathMax%)	:"_BS_ISteamAppList_GetAppInstallDir@16"
BS_ISteamAppList_GetAppInstallDirEx%(pThis%, iAppId%, pPathBuffer%, iPathMax%)	:"_BS_ISteamAppList_GetAppInstallDir@16"
BS_ISteamAppList_GetAppBuildId%(pThis%, iAppId%)								:"_BS_ISteamAppList_GetAppBuildId@8"