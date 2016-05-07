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

; HTTP ------------------------------------------------------------------------
BS_SteamHTTP%()																	:"_BS_SteamHTTP@0"
BS_SteamGameServerHTTP%()														:"_BS_SteamGameServerHTTP@0"
BS_ISteamHTTP_CreateHTTPRequest%(pThis%, EHTTPRequestMethod%, cAbsoluteUrl$)	:"_BS_ISteamHTTP_CreateHTTPRequest@12"
BS_ISteamHTTP_SetHTTPRequestContextValue%(pThis%, iRequest%, lContextValue%)	:"_BS_ISteamHTTP_SetHTTPRequestContextValue@12"
BS_ISteamHTTP_SetHTTPNetworkActivityTimeout%(pThis%, iRequest%, iSeconds%)		:"_BS_ISteamHTTP_SetHTTPNetworkActivityTimeout@12"
BS_ISteamHTTP_SetHTTPRequestHeaderValue%(pThis%, iRequest%, cName$, cValue$)	:"_BS_ISteamHTTP_SetHTTPRequestHeaderValue@16"
BS_ISteamHTTP_SetHTTPRequestGetOrPostParameter%(pThis%, iRequest%, cName$, cValue$):"_BS_ISteamHTTP_SetHTTPRequestGetOrPostParameter@16"
BS_ISteamHTTP_SendHTTPRequest%(pThis%, iRequest, lCallHandle%)					:"_BS_ISteamHTTP_SendHTTPRequest@12"
BS_ISteamHTTP_SendHTTPRequestAndStreamResponse%(pThis%, iRequest%, lCallHandle%):"_BS_ISteamHTTP_SendHTTPRequestAndStreamResponse@12"
BS_ISteamHTTP_DeferHTTPRequest%(pThis%, iRequest%)								:"_BS_ISteamHTTP_DeferHTTPRequest@8"
BS_ISteamHTTP_PrioritizeHTTPRequest%(pThis%, iRequest%)							:"_BS_ISteamHTTP_PrioritizeHTTPRequest@8"
BS_ISteamHTTP_GetHTTPResponseHeaderSize%(pThis%, iRequest%, cName$, piSize*)	:"_BS_ISteamHTTP_GetHTTPResponseHeaderSize@16"
BS_ISteamHTTP_GetHTTPResponseHeaderSizeEx%(pThis%, iRequest%, cName$, piSize%)	:"_BS_ISteamHTTP_GetHTTPResponseHeaderSize@16"
BS_ISteamHTTP_GetHTTPResponseHeaderValue%(pThis%, iRequest%, cName$, pBuffer*, iSize%):"_BS_ISteamHTTP_GetHTTPResponseHeaderValue@20"
BS_ISteamHTTP_GetHTTPResponseHeaderValueEx%(pThis%, iRequest%, cName$, pBuffer%, iSize%):"_BS_ISteamHTTP_GetHTTPResponseHeaderValue@20"
BS_ISteamHTTP_GetHTTPResponseBodySize%(pThis%, iRequest%, piSize*)				:"_BS_ISteamHTTP_GetHTTPResponseBodySize@12"
BS_ISteamHTTP_GetHTTPResponseBodySizeEx%(pThis%, iRequest%, piSize%)			:"_BS_ISteamHTTP_GetHTTPResponseBodySize@12"
BS_ISteamHTTP_GetHTTPResponseBodyData%(pThis%, iRequest%, pBuffer*, nSize%)		:"_BS_ISteamHTTP_GetHTTPResponseBodyData@16"
BS_ISteamHTTP_GetHTTPResponseBodyDataEx%(pThis%, iRequest%, pBuffer%, nSize%)	:"_BS_ISteamHTTP_GetHTTPResponseBodyData@16"
BS_ISteamHTTP_GetHTTPStreamingResponseBodyData%(pThis%, iRequest%, iOffset%, pBuffer*, nSize%):"_BS_ISteamHTTP_GetHTTPStreamingResponseBodyData@20"
BS_ISteamHTTP_GetHTTPStreamingResponseBodyDataEx%(pThis%, iRequest%, iOffset%, pBuffer%, nSize%):"_BS_ISteamHTTP_GetHTTPStreamingResponseBodyData@20"
BS_ISteamHTTP_ReleaseHTTPRequest%(pThis%, iRequest%)							:"_BS_ISteamHTTP_ReleaseHTTPRequest@8"
BS_ISteamHTTP_GetHTTPDownloadProgressPct%(pThis%, iRequest%, pfPercent*)		:"_BS_ISteamHTTP_GetHTTPDownloadProgressPct@12"
BS_ISteamHTTP_GetHTTPDownloadProgressPctEx%(pThis%, iRequest%, pfPercent%)		:"_BS_ISteamHTTP_GetHTTPDownloadProgressPct@12"
BS_ISteamHTTP_SetHTTPRequestRawPostBody%(pThis%, iRequest%, cType$, pBody*, nSize%):"_BS_ISteamHTTP_SetHTTPRequestRawPostBody@16"
BS_ISteamHTTP_SetHTTPRequestRawPostBodyEx%(pThis%, iRequest%, cType$, pBody*, nSize%):"_BS_ISteamHTTP_SetHTTPRequestRawPostBody@16"
BS_ISteamHTTP_CreateCookieContainer%(pThis%, bAllowResponsesToModify%)			:"_BS_ISteamHTTP_CreateCookieContainer@8"
BS_ISteamHTTP_ReleaseCookieContainer%(pThis%, iCookieContainer%)				:"_BS_ISteamHTTP_ReleaseCookieContainer@8"
BS_ISteamHTTP_SetCookie%(pthis%, iCookieContainer%, cHost$, cUrl$, cCookie$)	:"_BS_ISteamHTTP_SetCookie@20"
BS_ISteamHTTP_SetHTTPRequestCookieContainer%(pThis%, iRequest%, iCookieContainer%):"_BS_ISteamHTTP_SetHTTPRequestCookieContainer@12"
BS_ISteamHTTP_SetHTTPRequestUserAgentInfo%(pThis%, iRequest%, cUserAgent$)		:"_BS_ISteamHTTP_SetHTTPRequestUserAgentInfo@12"
BS_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate%(pThis%, iRequest%, bRequire%):"_BS_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate@12"
BS_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS%(pThis%, iRequest%, iMilliseconds%):"_BS_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS@12"
BS_ISteamHTTP_GetHTTPRequestWasTimedOut%(pThis%, iRequest%, pbWasTimedOut*)		:"_BS_ISteamHTTP_GetHTTPRequestWasTimedOut@12"
BS_ISteamHTTP_GetHTTPRequestWasTimedOutEx%(pThis%, iRequest%, pbWasTimedOut%)	:"_BS_ISteamHTTP_GetHTTPRequestWasTimedOut@12"