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

; HTMLSurface -----------------------------------------------------------------
BS_SteamHTMLSurface%()															:"_BS_SteamHTMLSurface@0"
BS_ISteamHTMLSurface_Init%(pThis%)												:"_BS_ISteamHTMLSurface_Init@4"
BS_ISteamHTMLSurface_Shutdown%(pThis%)											:"_BS_ISteamHTMLSurface_Shutdown@4"
BS_ISteamHTMLSurface_CreateBrowser%(pThis%, cUserAgent$, cUserCSS$)				:"_BS_ISteamHTMLSurface_CreateBrowser@12"
;! Function above returns a SteamAPICall_t*, clean it up afterwards!
BS_ISteamHTMLSurface_RemoveBrowser(pThis%, iHandle%)							:"_BS_ISteamHTMLSurface_RemoveBrowser@8"
BS_ISteamHTMLSurface_LoadURL(pThis%, iHandle%, cURL$, cPostData$)				:"_BS_ISteamHTMLSurface_LoadURL@16"
BS_ISteamHTMLSurface_SetSize(pThis%, iHandle%, iWidth%, iHeight%)				:"_BS_ISteamHTMLSurface_SetSize@16"
BS_ISteamHTMLSurface_StopLoad(pThis%, iHandle%)									:"_BS_ISteamHTMLSurface_StopLoad@8"
BS_ISteamHTMLSurface_Reload(pThis%, iHandle%)									:"_BS_ISteamHTMLSurface_Reload@8"
BS_ISteamHTMLSurface_GoBack(pThis%, iHandle%)									:"_BS_ISteamHTMLSurface_GoBack@8"
BS_ISteamHTMLSurface_GoForward(pThis%, iHandle%)								:"_BS_ISteamHTMLSurface_GoForward@8"
BS_ISteamHTMLSurface_AddHeader(pThis%, iHandle%, cKey$, cValue$)				:"_BS_ISteamHTMLSurface_AddHeader@16"
BS_ISteamHTMLSurface_ExecuteJavascript(pThis%, iHandle%, cScript$)				:"_BS_ISteamHTMLSurface_ExecuteJavascript@12"
BS_ISteamHTMLSurface_MouseUp(pThis%, iHandle%, EMouseButton%)					:"_BS_ISteamHTMLSurface_MouseUp@12"
BS_ISteamHTMLSurface_MouseDown(pThis%, iHandle%, EMouseButton%)					:"_BS_ISteamHTMLSurface_MouseDown@12"
BS_ISteamHTMLSurface_MouseDoubleClick(pThis%, iHandle%, EMouseButton%)			:"_BS_ISteamHTMLSurface_MouseDoubleClick@12"
BS_ISteamHTMLSurface_MouseMove(pThis%, iHandle%, X%, Y%)						:"_BS_ISteamHTMLSurface_MouseMove@16"
BS_ISteamHTMLSurface_MouseWheel(pThis%, iHandle%, iDelta%)						:"_BS_ISteamHTMLSurface_MouseWheel@12"
BS_ISteamHTMLSurface_KeyDown(pThis%, iHandle%, iKeyCode%, EHTMLKeyModifiers%)	:"_BS_ISteamHTMLSurface_KeyDown@16"
BS_ISteamHTMLSurface_KeyUp(pThis%, iHandle%, iKeyCode%, EHTMLKeyModifiers%)		:"_BS_ISteamHTMLSurface_KeyUp@16"
BS_ISteamHTMLSurface_KeyChar(pThis%, iHandle%, iUnicodeChar%, EHTMLKeyModifiers%):"_BS_ISteamHTMLSurface_KeyChar@16"
BS_ISteamHTMLSurface_SetHorizontalScroll(pThis%, iHandle%, iAbsolutePixelScroll%):"_BS_ISteamHTMLSurface_SetHorizontalScroll@16"
BS_ISteamHTMLSurface_SetVerticalScroll(pThis%, iHandle%, iAbsolutePixelScroll%)	:"_BS_ISteamHTMLSurface_SetVerticalScroll@16"
BS_ISteamHTMLSurface_SetKeyFocus(pThis%, iHandle%, bHasKeyFocus%)				:"_BS_ISteamHTMLSurface_SetKeyFocus@12"
BS_ISteamHTMLSurface_ViewSource(pThis%, iHandle%)								:"_BS_ISteamHTMLSurface_ViewSource@8"
BS_ISteamHTMLSurface_CopyToClipboard(pThis%, iHandle%)							:"_BS_ISteamHTMLSurface_CopyToClipboard@8"
BS_ISteamHTMLSurface_PasteFromClipboard(pThis%, iHandle%)						:"_BS_ISteamHTMLSurface_PasteFromClipboard@8"
BS_ISteamHTMLSurface_Find(pThis%, iHandle%, cSearch$, bCurrentlyInFind%, bReverse%):"_BS_ISteamHTMLSurface_Find@20"
BS_ISteamHTMLSurface_StopFind(pThis%, iHandle%)									:"_BS_ISteamHTMLSurface_StopFind@8"
BS_ISteamHTMLSurface_GetLinkAtPosition(pThis%, iHandle%, X%, Y%)				:"_BS_ISteamHTMLSurface_GetLinkAtPosition@16"
BS_ISteamHTMLSurface_SetCookie(pThis%, iHandle%, cHostName$, cKey$, cValue$, cPath$, nExpires%, bSecure%, bHTTPOnly%):"_BS_ISteamHTMLSurface_SetCookie@36"
BS_ISteamHTMLSurface_SetPageScaleFactor(pThis%, iHandle%, fZoom#, iX%, iY%)		:"_BS_ISteamHTMLSurface_SetPageScaleFactor@20"
BS_ISteamHTMLSurface_SetBackgroundMode(pThis%, iHandle%, bBackgroundMode%)		:"_BS_ISteamHTMLSurface_SetBackgroundMode@12"
BS_ISteamHTMLSurface_AllowStartRequest(pThis%, iHandle%, bAllowed%)				:"_BS_ISteamHTMLSurface_AllowStartRequest@12"
BS_ISteamHTMLSurface_JSDialogResponse(pThis%, iHandle%, bResult%)				:"_BS_ISteamHTMLSurface_JSDialogResponse@12"
BS_ISteamHTMLSurface_FileLoadDialogResponse(pThis%, iHandle%, pcSelectedFiles%)	:"_BS_ISteamHTMLSurface_FileLoadDialogResponse@12"