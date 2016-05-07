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

; User ------------------------------------------------------------------------
BS_SteamUser%()																	:"_BS_SteamUser@0"
BS_ISteamUser_GetHSteamUser%(pThis%)											:"_BS_ISteamUser_GetHSteamUser@4"
BS_ISteamUser_IsLoggedOn%(pThis%)												:"_BS_ISteamUser_IsLoggedOn@4"
BS_ISteamUser_GetSteamID%(pThis%)												:"_BS_ISteamUser_GetSteamID@4"
BS_ISteamUser_InitiateGameConnection%(pThis%, pAuthBlob*, iAuthBlobSize%, lSteamId%, iIp%, sPort%, bSecure%):"_BS_ISteamUser_InitiateGameConnection@28"
BS_ISteamUser_InitiateGameConnectionEx%(pThis%, pAuthBlob%, iAuthBlobSize%, lSteamId%, iIp%, sPort%, bSecure%):"_BS_ISteamUser_InitiateGameConnection@28"
BS_ISteamUser_TerminateGameConnection(pThis%, iIp%, sPort%)						:"_BS_ISteamUser_TerminateGameConnection@12"
BS_ISteamUser_TrackAppUsageEvent(pThis%, iAppId%, EAppUsageEvent%, cExtraInfo$)	:"_BS_ISteamUser_TrackAppUsageEvent@16"
BS_ISteamUser_GetUserDataFolder%(pThis%, pBuffer*, iBufferSize%)				:"_BS_ISteamUser_GetUserDataFolder@12"
BS_ISteamUser_StartVoiceRecording(pThis%)										:"_BS_ISteamUser_StartVoiceRecording@4"
BS_ISteamUser_StopVoiceRecording(pThis%)										:"_BS_ISteamUser_StopVoiceRecording@4"
BS_ISteamUser_GetAvailableVoice%(pThis%, pCompressed*, pUncompressed*, nDesiredSampleRate%):"_BS_ISteamUser_GetAvailableVoice@16"
BS_ISteamUser_GetAvailableVoiceEx%(pThis%, pCompressed%, pUncompressed%, nDesiredSampleRate%):"_BS_ISteamUser_GetAvailableVoice@16"
BS_ISteamUser_GetVoice%(pThis%, bCompressed%, pCompressed*, iCompressedSize%, piCompressedBytesWritten*, bUncompressed%, pUncompressed*, iUncompressedSize%, piUncompressedBytesWritten*, iSampleRate%):"_BS_ISteamUser_GetVoice@36"
BS_ISteamUser_GetVoiceEx%(pThisEx%, bCompressed%, pCompressed%, iCompressedSize%, piCompressedBytesWritten%, bUncompressed%, pUncompressed%, iUncompressedSize%, piUncompressedBytesWritten%, iSampleRate%):"_BS_ISteamUser_GetVoice@36"
BS_ISteamUser_DecompressVoice(pThis%, pCompressed*, iCompressedSize%, pUncompressed*, iUncompressedSize%, iUncompressedBytesWritten*, iSampleRate%):"_BS_ISteamUser_DecompressVoice@28"
BS_ISteamUser_DecompressVoiceEx(pThis%, pCompressed*, iCompressedSize%, pUncompressed%, iUncompressedSize%, iUncompressedBytesWritten%, iSampleRate%):"_BS_ISteamUser_DecompressVoice@28"
BS_ISteamUser_GetVoiceOptimalSampleRate%(pThis%)								:"_BS_ISteamUser_GetVoiceOptimalSampleRate@4"
BS_ISteamUser_GetAuthSessionTicket%(pThis%, pTicket*, iTicketSize%, piTicketSize*):"_BS_ISteamUser_GetAuthSessionTicket@16"
BS_ISteamUser_BeginAuthSession%(pThis%, pAuthTicket*, iAuthTicketSize%, lSteamId%):"_BS_ISteamUser_BeginAuthSession@16"
BS_ISteamUser_EndAuthSession(pThis%, lSteamId%)									:"_BS_ISteamUser_EndAuthSession@8"
BS_ISteamUser_CancelAuthTicket(pThis%, hAuthTicket%)							:"_BS_ISteamUser_CancelAuthTicket@8"
BS_ISteamUser_UserHasLicenseForApp%(pThis%, lSteamId%, iAppId%)					:"_BS_ISteamUser_UserHasLicenseForApp@12"
BS_ISteamUser_IsBehindNAT%(pThis%)												:"_BS_ISteamUser_IsBehindNAT@4"
BS_ISteamUser_AdvertiseGame%(pThis%, lSteamId%, iIp%, sPort%)					:"_BS_ISteamUser_AdvertiseGame@16"
BS_ISteamUser_RequestEncryptedAppTicket%(pThis%, pData*, iDataSize%)			:"_BS_ISteamUser_RequestEncryptedAppTicket@12"
BS_ISteamUser_GetEncryptedAppTicket%(pThis%, pTicket*, iTicketSize%, piTicketSize*):"_BS_ISteamUser_GetEncryptedAppTicket@16"
BS_ISteamUser_GetGameBadgeLevel%(pThis%, iSeries%, bFoil%)						:"_BS_ISteamUser_GetGameBadgeLevel@12"
BS_ISteamUser_GetPlayerSteamLevel%(pThis%)										:"_BS_ISteamUser_GetPlayerSteamLevel@4"
BS_ISteamUser_RequestStoreAuthURL%(pThis%, cRedirectUrl$)						:"_BS_ISteamUser_RequestStoreAuthURL@8"