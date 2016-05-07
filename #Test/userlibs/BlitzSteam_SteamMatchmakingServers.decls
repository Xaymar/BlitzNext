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

; MatchmakingServers ----------------------------------------------------------
BS_SteamMatchmakingServers%()													:"_BS_SteamMatchmakingServers@0"
BS_ISteamMatchmakingServers_RequestInternetServerList%(pThis%, iApp%, ppchFilters*, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestInternetServerList@20"
BS_ISteamMatchmakingServers_RequestInternetServerListEx%(pThis%, iApp%, ppchFilters%, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestInternetServerList@20"
BS_ISteamMatchmakingServers_RequestLANServerList%(pThis%, iApp%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestLANServerList@12"
BS_ISteamMatchmakingServers_RequestFriendsServerList%(pThis%, iApp%, ppchFilters*, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestFriendsServerList@20"
BS_ISteamMatchmakingServers_RequestFriendsServerListEx%(pThis%, iApp%, ppchFilters%, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestFriendsServerList@20"
BS_ISteamMatchmakingServers_RequestFavoritesServerList%(pThis%, iApp%, ppchFilters*, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestFavoritesServerList@20"
BS_ISteamMatchmakingServers_RequestFavoritesServerListEx%(pThis%, iApp%, ppchFilters%, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestFavoritesServerList@20"
BS_ISteamMatchmakingServers_RequestHistoryServerList%(pThis%, iApp%, ppchFilters*, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestHistoryServerList@20"
BS_ISteamMatchmakingServers_RequestHistoryServerListEx%(pThis%, iApp%, ppchFilters%, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestHistoryServerList@20"
BS_ISteamMatchmakingServers_RequestSpectatorServerList%(pThis%, iApp%, ppchFilters*, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestSpectatorServerList@20"
BS_ISteamMatchmakingServers_RequestSpectatorServerListEx%(pThis%, iApp%, ppchFilters%, nFilters%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_RequestSpectatorServerList@20"
BS_ISteamMatchmakingServers_ReleaseRequest%(pThis%, hServerListRequest%)		:"_BS_ISteamMatchmakingServers_ReleaseRequest@8"
BS_ISteamMatchmakingServers_GetServerDetails%(pThis%, hRequest%, iServer%)		:"_BS_ISteamMatchmakingServers_GetServerDetails@12"
BS_ISteamMatchmakingServers_CancelQuery%(pThis%, hRequest%)						:"_BS_ISteamMatchmakingServers_CancelQuery@8"
BS_ISteamMatchmakingServers_RefreshQuery%(pThis%, hRequest%)					:"_BS_ISteamMatchmakingServers_RefreshQuery@8"
BS_ISteamMatchmakingServers_IsRefreshing%(pThis%, hRequest%)					:"_BS_ISteamMatchmakingServers_IsRefreshing@8"
BS_ISteamMatchmakingServers_GetServerCount%(pThis%, hRequest%)					:"_BS_ISteamMatchmakingServers_GetServerCount@8"
BS_ISteamMatchmakingServers_RefreshServer%(pThis%, hRequest%)					:"_BS_ISteamMatchmakingServers_RefreshServer@8"
BS_ISteamMatchmakingServers_PingServer%(pThis%, unIP%, usPort%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_PingServer@16"
BS_ISteamMatchmakingServers_PlayerDetails%(pThis%, unIP%, usPort%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_PlayerDetails@16"
BS_ISteamMatchmakingServers_ServerRules%(pThis%, unIP%, usPort%, pRequestServersResponse%):"_BS_ISteamMatchmakingServers_ServerRules@16"
BS_ISteamMatchmakingServers_CancelServerQuery%(pThis%, hServerQuery)			:"_BS_ISteamMatchmakingServers_CancelServerQuery@8"