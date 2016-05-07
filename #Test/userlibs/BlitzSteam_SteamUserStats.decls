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

; UserStats -------------------------------------------------------------------
BS_UserStats%()																	:"_BS_UserStats@0"
BS_UserStats_RequestCurrentStats%(pThis%)										:"_BS_UserStats_RequestCurrentStats@4"
BS_UserStats_GetStat%(pThis%, cName$, pData*)									:"_BS_UserStats_GetStat@12"
BS_UserStats_GetStatEx%(pThis%, cName$, pData%)									:"_BS_UserStats_GetStat@12"
BS_UserStats_GetStatF%(pThis%, cName$, pData*)									:"_BS_UserStats_GetStatF@12"
BS_UserStats_GetStatFEx%(pThis%, cName$, pData%)								:"_BS_UserStats_GetStatF@12"
BS_UserStats_SetStat%(pThis%, cName$, pData%)									:"_BS_UserStats_SetStat@12"
BS_UserStats_SetStatF%(pThis%, cName$, pData#)									:"_BS_UserStats_SetStatF@12"
BS_UserStats_UpdateAvgRateStat%(pThis%, cName$, fCountThisSession#, dSessionLength%):"_BS_UserStats_UpdateAvgRateStat@16"
BS_UserStats_GetAchievement%(pThis%, cName$, pbAchieved*)						:"_BS_UserStats_GetAchievement@12"
BS_UserStats_GetAchievementEx%(pThis%, cName$, pbAchieved%)						:"_BS_UserStats_GetAchievement@12"
BS_UserStats_SetAchievement%(pThis%, cName$)									:"_BS_UserStats_SetAchievement@8"
BS_UserStats_ClearAchievement%(pThis%, cName$)									:"_BS_UserStats_ClearAchievement@8"
BS_UserStats_GetAchievementAndUnlockTime%(pThis%, cName$, pbAchieved*, piUnlockTime*):"_BS_UserStats_GetAchievementAndUnlockTime@16"
BS_UserStats_GetAchievementAndUnlockTimeEx%(pThis%, cName$, pbAchieved%, piUnlockTime%):"_BS_UserStats_GetAchievementAndUnlockTime@16"
BS_UserStats_StoreStats%(pThis%)												:"_BS_UserStats_StoreStats@4"
BS_UserStats_GetAchievementIcon%(pThis%, cName$)								:"_BS_UserStats_GetAchievementIcon@8"
BS_UserStats_GetAchievementDisplayAttribute$(pThis%, cName$, cKey$)				:"_BS_UserStats_GetAchievementDisplayAttribute@12"
BS_UserStats_IndicateAchievementProgress%(pThis%, cName$, iProgress%, iMaxProgress%):"_BS_UserStats_IndicateAchievementProgress@16"
BS_UserStats_GetNumAchievements%(pThis%)										:"_BS_UserStats_GetNumAchievements@4"
BS_UserStats_GetAchievementName$(pThis%, iAchievement%)							:"_BS_UserStats_GetAchievementName@8"
BS_UserStats_RequestUserStats%(pThis%, lSteamId%)								:"_BS_UserStats_RequestUserStats@8"
BS_UserStats_GetUserStat%(pThis%, lSteamId%, cName$, pData*)					:"_BS_UserStats_GetUserStat@16"
BS_UserStats_GetUserStatEx%(pThis%, lSteamId%, cName$, pData%)					:"_BS_UserStats_GetUserStat@16"
BS_UserStats_GetUserStatF%(pThis%, lSteamId%, cName$, pData*)					:"_BS_UserStats_GetUserStatF@16"
BS_UserStats_GetUserStatFEx%(pThis%, lSteamId%, cName$, pData%)					:"_BS_UserStats_GetUserStatF@16"
BS_UserStats_GetUserAchievement%(pThis%, lSteamId%, cName$, pbAchieved*)		:"_BS_UserStats_GetUserAchievement@16"
BS_UserStats_GetUserAchievementEx%(pThis%, lSteamId%, cName$, pbAchieved%)		:"_BS_UserStats_GetUserAchievement@16"
BS_UserStats_GetUserAchievementAndUnlockTime%(pThis%, lSteamId%, cName$, pbAchieved*, piUnlockTime*):"_BS_UserStats_GetUserAchievementAndUnlockTime@20"
BS_UserStats_GetUserAchievementAndUnlockTimeEx%(pThis%, lSteamId%, cName$, pbAchieved%, piUnlockTime%):"_BS_UserStats_GetUserAchievementAndUnlockTime@20"
BS_UserStats_ResetAllStats%(pThis%, bAchievementsToo%)							:"_BS_UserStats_ResetAllStats@8"
BS_UserStats_FindOrCreateLeaderboard%(pThis%, cLeaderboardName$, eLeaderboardSortMethod%, eLeaderboardDisplayType%):"_BS_UserStats_FindOrCreateLeaderboard@16"
BS_UserStats_FindLeaderboard%(pThis%, cLeaderboardName$)						:"_BS_UserStats_FindLeaderboard@8"
BS_UserStats_GetLeaderboardName$(pThis%, hSteamLeaderboard%)					:"_BS_UserStats_GetLeaderboardName@8"
BS_UserStats_GetLeaderboardEntryCount%(pThis%, hSteamLeaderboard%)				:"_BS_UserStats_GetLeaderboardEntryCount@8"
BS_UserStats_GetLeaderboardSortMethod%(pThis%, hSteamLeaderboard%)				:"_BS_UserStats_GetLeaderboardSortMethod@8"
BS_UserStats_GetLeaderboardDisplayType%(pThis%, hSteamLeaderboard%)				:"_BS_UserStats_GetLeaderboardDisplayType@8"
BS_UserStats_DownloadLeaderboardEntries%(pThis%, hSteamLeaderboard%, eLeaderboardDataRequest%, iRangeStart%, iRangeEnd%):"_BS_UserStats_DownloadLeaderboardEntries@20"
BS_UserStats_DownloadLeaderboardEntriesForUsers%(pThis%, hSteamLeaderboard%, plUsers*, iUserCount%):"_BS_UserStats_DownloadLeaderboardEntriesForUsers@16"
BS_UserStats_DownloadLeaderboardEntriesForUsersEx%(pThis%, hSteamLeaderboard%, plUsers%, iUserCount%):"_BS_UserStats_DownloadLeaderboardEntriesForUsers@16"
BS_UserStats_GetDownloadedLeaderboardEntry%(lpSteamUsers%, hSteamLeaderboardEntries%, iIndex%, pLeaderboardEntry*, pDetails*, iDetailsMax%):"_BS_UserStats_GetDownloadedLeaderboardEntry@24"
BS_UserStats_GetDownloadedLeaderboardEntryEx%(lpSteamUsers%, hSteamLeaderboardEntries%, iIndex%, pLeaderboardEntry%, pDetails%, iDetailsMax%):"_BS_UserStats_GetDownloadedLeaderboardEntry@24"
BS_UserStats_UploadLeaderboardScore%(pThis%, hSteamLeaderboard%, eLeaderboardUploadScoreMethod%, iScore%, pScoreDetails*, iScoreDetailsCount%):"_BS_UserStats_UploadLeaderboardScore@24"
BS_UserStats_UploadLeaderboardScoreEx%(pThis%, hSteamLeaderboard%, eLeaderboardUploadScoreMethod%, iScore%, pScoreDetails%, iScoreDetailsCount%):"_BS_UserStats_UploadLeaderboardScore@24"
BS_UserStats_AttachLeaderboardUGC%(pThis%, hSteamLeaderboard%, hUGC%)			:"_BS_UserStats_AttachLeaderboardUGC@12"
BS_UserStats_GetNumberOfCurrentPlayers%(pThis%)									:"_BS_UserStats_GetNumberOfCurrentPlayers@4"
BS_UserStats_RequestGlobalAchievementPercentages%(pThis%)						:"_BS_UserStats_RequestGlobalAchievementPercentages@4"
BS_UserStats_GetMostAchievedAchievementInfo%(pThis%, cName$, iNameLength%, pfPercent*, pbAchieved*):"_BS_UserStats_GetMostAchievedAchievementInfo@20"
BS_UserStats_GetMostAchievedAchievementInfoEx%(pThis%, cName$, iNameLength%, pfPercent%, pbAchieved%):"_BS_UserStats_GetMostAchievedAchievementInfo@20"
BS_UserStats_GetNextMostAchievedAchievementInfo%(pThis%, iIteratorPrevious%, cName$, iNameLength%, pfPercent*, pbAchieved*):"_BS_UserStats_GetNextMostAchievedAchievementInfo@24"
BS_UserStats_GetNextMostAchievedAchievementInfoEx%(pThis%, iIteratorPrevious%, cName$, iNameLength%, pfPercent%, pbAchieved%):"_BS_UserStats_GetNextMostAchievedAchievementInfo@24"
BS_UserStats_GetAchievementAchievedPercent%(pThis%, cName$, pfPercent*)			:"_BS_UserStats_GetAchievementAchievedPercent@12"
BS_UserStats_GetAchievementAchievedPercentEx%(pThis%, cName$, pfPercent%)		:"_BS_UserStats_GetAchievementAchievedPercent@12"
BS_UserStats_RequestGlobalStats%(pThis%, iHistoryDays%)							:"_BS_UserStats_RequestGlobalStats@8"
BS_UserStats_GetGlobalStatL%(pThis, cStatName$, plData%)						:"_BS_UserStats_GetGlobalStatL@12"
BS_UserStats_GetGlobalStatD%(pThis, cStatName$, pdData%)						:"_BS_UserStats_GetGlobalStatD@12"
BS_UserStats_GetGlobalStatHistoryL%(pThis, cStatName$, plDataArray%, iDataSize%):"BS_UserStats_GetGlobalStatHistoryL@16"
BS_UserStats_GetGlobalStatHistoryD%(pThis, cStatName$, pdDataArray%, iDataSize%):"BS_UserStats_GetGlobalStatHistoryD@16"