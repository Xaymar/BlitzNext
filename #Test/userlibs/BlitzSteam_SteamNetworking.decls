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

; Networking ------------------------------------------------------------------
BS_SteamNetworking%()															:"_BS_SteamNetworking@0"
BS_SteamGameServerNetworking%()													:"_BS_SteamGameServerNetworking@0"
BS_ISteamNetworking_SendP2PPacket%(pThis%, lRemoteSteamId%, pData*, iDataSize%, EP2PSendType%, iChannel%):"_BS_ISteamNetworking_SendP2PPacket@24"
BS_ISteamNetworking_SendP2PPacketEx%(pThis%, lRemoteSteamId%, pData%, iDataSize%, EP2PSendType%, iChannel%):"_BS_ISteamNetworking_SendP2PPacket@24"
BS_ISteamNetworking_IsP2PPacketAvailable%(pThis%, piSize*, iChannel%)			:"_BS_ISteamNetworking_IsP2PPacketAvailable@12"
BS_ISteamNetworking_IsP2PPacketAvailableEx%(pThis%, piSize%, iChannel%)			:"_BS_ISteamNetworking_IsP2PPacketAvailable@12"
BS_ISteamNetworking_ReadP2PPacket%(pThis%, pBuffer*, iBufferSize%, piMessageSize*, plRemoteSteamId*, iChannel%):"_BS_ISteamNetworking_ReadP2PPacket@24"
BS_ISteamNetworking_ReadP2PPacketEx%(pThis%, pBuffer%, iBufferSize%, piMessageSize%, plRemoteSteamId%, iChannel%):"_BS_ISteamNetworking_ReadP2PPacket@24"
BS_ISteamNetworking_AcceptP2PSessionWithUser%(pThis%, lRemoteSteamId%)			:"_BS_ISteamNetworking_AcceptP2PSessionWithUser@8"
BS_ISteamNetworking_CloseP2PSessionWithUser%(pThis%, lRemoteSteamId%)			:"_BS_ISteamNetworking_CloseP2PSessionWithUser@8"
BS_ISteamNetworking_CloseP2PChannelWithUser%(pThis%, lRemoteSteamId%, iChannel%):"_BS_ISteamNetworking_CloseP2PChannelWithUser@12"
BS_ISteamNetworking_GetP2PSessionState%(pThis%, lRemoteSteamId%, pConnectionState*):"_BS_ISteamNetworking_GetP2PSessionState@12"
BS_ISteamNetworking_AllowP2PPacketRelay%(pThis%, bAllow%)						:"_BS_ISteamNetworking_AllowP2PPacketRelay@8"