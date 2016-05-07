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
; Generic ---------------------------------------------------------------------
BS_Helper_FormatUnixTime$(unixTime%, pchFormat$)								:"_BS_Helper_FormatUnixTime@8"
BS_Helper_CopyMemoryIntMangle(pSource%, pDest%, iMangling%, iSourceW%, iSourceH%, iDestW%, iDestH%, iAreaX%, iAreaY%, iAreaW%, iAreaH%):"_BS_Helper_CopyMemoryIntMangle@44"

BS_BlitzPointer_GetReturnAddress%()												:"_BS_BlitzPointer_GetReturnAddress@0"
BS_BlitzPointer_GetFunctionPointer%()											:"_BS_BlitzPointer_GetFunctionPointer@0"