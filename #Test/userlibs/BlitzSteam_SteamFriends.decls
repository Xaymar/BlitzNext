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

; Friends ---------------------------------------------------------------------
BS_SteamFriends%()																:"_BS_SteamFriends@0"
BS_ISteamFriends_GetPersonaName$(pThis%)										:"_BS_ISteamFriends_GetPersonaName@4"
BS_ISteamFriends_SetPersonaName%(pThis%, cPersonaName$)							:"_BS_ISteamFriends_SetPersonaName@8"
;! Returns: SteamAPICall_t*. Clean Up!
BS_ISteamFriends_GetPersonaState%(pThis%)										:"_BS_ISteamFriends_GetPersonaState@4"
BS_ISteamFriends_GetFriendCount%(pThis%, EFriendFlags%)							:"_BS_ISteamFriends_GetFriendCount@8"
BS_ISteamFriends_GetFriendByIndex%(pThis%, iFriend%, EFriendFlags%)				:"_BS_ISteamFriends_GetFriendByIndex@12"
;! Returns: CSteamID*. Clean Up!
BS_ISteamFriends_GetFriendRelationship%(pThis%, pllFriend%)						:"_BS_ISteamFriends_GetFriendRelationship@8"
BS_ISteamFriends_GetFriendPersonaState%(pThis%, pllFriend%)						:"_BS_ISteamFriends_GetFriendPersonaState@8"
BS_ISteamFriends_GetFriendPersonaName$(pThis%, pllFriend%)						:"_BS_ISteamFriends_GetFriendPersonaName@8"
BS_ISteamFriends_GetFriendGamePlayed%(pThis%, pllFriend%, pFriendGameInfo*)		:"_BS_ISteamFriends_GetFriendGamePlayed@12"
BS_ISteamFriends_GetFriendGamePlayedEx%(pThis%, pllFriend%, pFriendGameInfo%)	:"_BS_ISteamFriends_GetFriendGamePlayed@12"
BS_ISteamFriends_GetFriendPersonaNameHistory$(pThis%, pllFriend%, iDepth%)		:"_BS_ISteamFriends_GetFriendPersonaNameHistory@12"
BS_ISteamFriends_GetFriendSteamLevel%(pThis%, pllFriend%)						:"_BS_ISteamFriends_GetFriendSteamLevel@8"
BS_ISteamFriends_GetPlayerNickname$(pThis%, pllFriend%)							:"_BS_ISteamFriends_GetPlayerNickname@8"
BS_ISteamFriends_GetFriendsGroupCount%(pThis%)									:"_BS_ISteamFriends_GetFriendsGroupCount@4"
BS_ISteamFriends_GetFriendsGroupIDByIndex%(pThis%, iIndex%)						:"_BS_ISteamFriends_GetFriendsGroupIDByIndex@8"
BS_ISteamFriends_GetFriendsGroupName$(pThis%, iGroupID%)						:"_BS_ISteamFriends_GetFriendsGroupName@8"
BS_ISteamFriends_GetFriendsGroupMembersCount%(pThis%, iGroupID%)				:"_BS_ISteamFriends_GetFriendsGroupMembersCount@8"
BS_ISteamFriends_GetFriendsGroupMembersList(pThis%, iGroupID%, pllMembers*, nMembersCount%):"_BS_ISteamFriends_GetFriendsGroupMembersList@16"
BS_ISteamFriends_GetFriendsGroupMembersListEx(pThis%, iGroupID%, pllMembers%, nMembersCount%):"_BS_ISteamFriends_GetFriendsGroupMembersList@16"
BS_ISteamFriends_HasFriend(pThis%, pllFriend%, EFriendFlags%)					:"_BS_ISteamFriends_HasFriend@12"
BS_ISteamFriends_GetClanCount%(pThis%)											:"_BS_ISteamFriends_GetClanCount@4"
BS_ISteamFriends_GetClanByIndex%(pThis%, iClan%)								:"_BS_ISteamFriends_GetClanByIndex@8"
BS_ISteamFriends_GetClanName$(pThis%, llClanID%)								:"_BS_ISteamFriends_GetClanName@8"
BS_ISteamFriends_GetClanTag$(pThis%, llClanID%)									:"_BS_ISteamFriends_GetClanTag@8"
BS_ISteamFriends_GetClanActivityCounts%(pThis%, llClanID%, pnOnline*, pnInGame*, pnChatting*):"_BS_ISteamFriends_GetClanActivityCounts@20"
BS_ISteamFriends_GetClanActivityCountsEx%(pThis%, llClanID%, pnOnline%, pnInGame%, pnChatting%):"_BS_ISteamFriends_GetClanActivityCounts@20"
BS_ISteamFriends_DownloadClanActivityCounts%(pThis%, llClanID%, cClansToRequest%):"_BS_ISteamFriends_DownloadClanActivityCounts@12"
BS_ISteamFriends_GetFriendCountFromSource%(pThis%, llSourceID%)					:"_BS_ISteamFriends_GetFriendCountFromSource@8"
BS_ISteamFriends_GetFriendFromSourceByIndex%(pThis%, llSourceID%, iFriend%)		:"_BS_ISteamFriends_GetFriendFromSourceByIndex@12"
BS_ISteamFriends_IsUserInSource%(pThis%, llSteamID%, llSourceID%)				:"_BS_ISteamFriends_IsUserInSource@12"
BS_ISteamFriends_SetInGameVoiceSpeaking(pThis%, llSteamID%, bSpeaking%)			:"_BS_ISteamFriends_SetInGameVoiceSpeaking@12"
BS_ISteamFriends_ActivateGameOverlay(pThis%, cDialog$)							:"_BS_ISteamFriends_ActivateGameOverlay@8"
BS_ISteamFriends_ActivateGameOverlayToUser(pThis%, cDialog$, llSteamID%)		:"_BS_ISteamFriends_ActivateGameOverlayToUser@12"
BS_ISteamFriends_ActivateGameOverlayToWebPage(pThis%, cURL$)					:"_BS_ISteamFriends_ActivateGameOverlayToWebPage@8"
BS_ISteamFriends_ActivateGameOverlayToStore(pThis%, nAppID%, EOverlayToStoreFlag%):"_BS_ISteamFriends_ActivateGameOverlayToStore@12"
BS_ISteamFriends_SetPlayedWith(pThis%, llSteamID%)								:"_BS_ISteamFriends_SetPlayedWith@8"
BS_ISteamFriends_ActivateGameOverlayInviteDialog(pThis%, llLobbyID%)			:"_BS_ISteamFriends_ActivateGameOverlayInviteDialog@8"
BS_ISteamFriends_GetSmallFriendAvatar%(pThis%, llSteamID%)						:"_BS_ISteamFriends_GetSmallFriendAvatar@8"
BS_ISteamFriends_GetMediumFriendAvatar%(pThis%, llSteamID%)						:"_BS_ISteamFriends_GetMediumFriendAvatar@8"
BS_ISteamFriends_GetLargeFriendAvatar%(pThis%, llSteamID%)						:"_BS_ISteamFriends_GetLargeFriendAvatar@8"
BS_ISteamFriends_RequestUserInformation%(pThis%, llSteamID%, bNameOnly%)		:"_BS_ISteamFriends_RequestUserInformation@12"
BS_ISteamFriends_RequestClanOfficerList%(pThis%, llClanID%)						:"_BS_ISteamFriends_RequestClanOfficerList@8"
BS_ISteamFriends_GetClanOwner%(pThis%, llClanID%)								:"_BS_ISteamFriends_GetClanOwner@8"
BS_ISteamFriends_GetClanOfficerCount%(pThis%, llClanID%)						:"_BS_ISteamFriends_GetClanOfficerCount@8"
BS_ISteamFriends_GetClanOfficerByIndex%(pThis%, llClanID%, iOfficer%)			:"_BS_ISteamFriends_GetClanOfficerByIndex@12"
;! Returns: CSteamID*. Clean Up!
BS_ISteamFriends_GetUserRestrictions%(pThis%)									:"_BS_ISteamFriends_GetUserRestrictions@4"
BS_ISteamFriends_SetRichPresence%(pThis%, cKey$, cValue$)						:"_BS_ISteamFriends_SetRichPresence@12"
BS_ISteamFriends_ClearRichPresence(pThis%)										:"_BS_ISteamFriends_ClearRichPresence@4"
BS_ISteamFriends_GetFriendRichPresence$(pThis%, llSteamID%, cKey$)				:"_BS_ISteamFriends_GetFriendRichPresence@12"
BS_ISteamFriends_GetFriendRichPresenceKeyCount%(pThis%, llSteamID%)				:"_BS_ISteamFriends_GetFriendRichPresenceKeyCount@8"
BS_ISteamFriends_GetFriendRichPresenceKeyByIndex$(pThis%, llSteamID%, iKey%)	:"_BS_ISteamFriends_GetFriendRichPresenceKeyByIndex@12"
BS_ISteamFriends_RequestFriendRichPresence(pThis%, llSteamID%)					:"_BS_ISteamFriends_RequestFriendRichPresence@8"
BS_ISteamFriends_InviteUserToGame%(pThis%, llSteamID%, cConnectString%)			:"_BS_ISteamFriends_InviteUserToGame@12"
BS_ISteamFriends_GetCoplayFriendCount%(pThis%)									:"_BS_ISteamFriends_GetCoplayFriendCount@4"
BS_ISteamFriends_GetCoplayFriend%(pThis%, iCoplayFriend%)						:"_BS_ISteamFriends_GetCoplayFriend@8"
;! Returns: CSteamID*. Clean Up!
BS_ISteamFriends_GetFriendCoplayTime%(pThis%, llSteamID%)						:"_BS_ISteamFriends_GetFriendCoplayTime@8"
BS_ISteamFriends_GetFriendCoplayGame%(pThis%, llSteamID%)						:"_BS_ISteamFriends_GetFriendCoplayGame@8"
BS_ISteamFriends_JoinClanChatRoom%(pThis%, llClanID%)							:"_BS_ISteamFriends_JoinClanChatRoom@8"
;! Returns: SteamAPICall_t*. Clean Up!
BS_ISteamFriends_LeaveClanChatRoom%(pThis%, llClanID%)							:"_BS_ISteamFriends_LeaveClanChatRoom@8"
BS_ISteamFriends_GetClanChatMemberCount%(pThis%, llClanID%)						:"_BS_ISteamFriends_GetClanChatMemberCount@8"
BS_ISteamFriends_GetChatMemberByIndex%(pThis%, llClanID%, iUser%)				:"_BS_ISteamFriends_GetChatMemberByIndex@12"
;! Returns: CSteamID*. Clean Up!
BS_ISteamFriends_SendClanChatMessage%(pThis%, llClanChatID%, cMessage$)			:"_BS_ISteamFriends_SendClanChatMessage@12"
BS_ISteamFriends_GetClanChatMessage%(pThis%, llClanChatID%, iMessage%, pMessage*, iMessageSize%, pEChatEntryType*, pSteamID*):"_BS_ISteamFriends_GetClanChatMessage@28"
BS_ISteamFriends_GetClanChatMessageEx%(pThis%, llClanChatID%, iMessage%, pMessage%, iMessageSize%, peChatEntryType%, pSteamID%):"_BS_ISteamFriends_GetClanChatMessage@28"
BS_ISteamFriends_IsClanChatAdmin%(pThis%, llClanChatID%, llSteamID%)			:"_BS_ISteamFriends_IsClanChatAdmin@12"
BS_ISteamFriends_IsClanChatWindowOpenInSteam%(pThis%, llClanChatID%)			:"_BS_ISteamFriends_IsClanChatWindowOpenInSteam@8"
BS_ISteamFriends_OpenClanChatWindowInSteam%(pThis%, llClanChatID%)				:"_BS_ISteamFriends_OpenClanChatWindowInSteam@8"
BS_ISteamFriends_CloseClanChatWindowInSteam%(pThis%, llClanChatID%)				:"_BS_ISteamFriends_CloseClanChatWindowInSteam@8"
BS_ISteamFriends_SetListenForFriendsMessages%(pThis%, bInterceptEnabled%)		:"_BS_ISteamFriends_SetListenForFriendsMessages@8"
BS_ISteamFriends_ReplyToFriendMessage%(pThis%, llSteamID%, cMessage$)			:"_BS_ISteamFriends_ReplyToFriendMessage@12"
BS_ISteamFriends_GetFriendMessage%(pThis%, llSteamID%, iMessageID%, pData*, iDataSize%, pEChatEntryType*):"_BS_ISteamFriends_GetFriendMessage@24"
BS_ISteamFriends_GetFriendMessageEx%(pThis%, llSteamID%, iMessageID%, pData%, iDataSize%, pEChatEntryType%):"_BS_ISteamFriends_GetFriendMessage@24"
BS_ISteamFriends_GetFollowerCount%(pThis%, llSteamID%)							:"_BS_ISteamFriends_GetFollowerCount@8"
;! Returns: SteamAPICall_t*. Clean Up!
BS_ISteamFriends_IsFollowing%(pThis%, llSteamID%)								:"_BS_ISteamFriends_IsFollowing@8"
;! Returns: SteamAPICall_t*. Clean Up!
BS_ISteamFriends_EnumerateFollowingList%(pThis%, iStartIndex%)					:"_BS_ISteamFriends_EnumerateFollowingList@8"
;! Returns: SteamAPICall_t*. Clean Up!