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

; Steam -----------------------------------------------------------------------
BS_SteamAPI_Init%()																:"_BS_SteamAPI_Init@0"
BS_SteamAPI_Shutdown()															:"_BS_SteamAPI_Shutdown@0"
BS_SteamAPI_IsSteamRunning%()													:"_BS_SteamAPI_IsSteamRunning@0"
BS_SteamAPI_RestartAppIfNecessary%(iAppId%)										:"_BS_SteamAPI_RestartAppIfNecessary@4"
BS_SteamAPI_SetMiniDumpComment(cComment$)										:"_BS_SteamAPI_SetMiniDumpComment@4"
BS_SteamAPI_WriteMiniDump(iExceptionCode%, pExceptionInfo*, iBuildId%)			:"_BS_SteamAPI_WriteMiniDump@12"
BS_SteamAPI_WriteMiniDumpEx(iExceptionCode%, pExceptionInfo%, iBuildId%)		:"_BS_SteamAPI_WriteMiniDump@12"
BS_SteamAPI_ReleaseCurrentThreadMemory%()										:"_BS_SteamAPI_ReleaseCurrentThreadMemory@0"
BS_SteamAPI_RunCallbacks()														:"_BS_SteamAPI_RunCallbacks@0"