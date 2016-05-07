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
; Long ------------------------------------------------------------------------
BS_Long_New%()																	:"_BS_Long_New@0"
BS_Long_Copy%(pThis%)															:"_BS_Long_Copy@4"
BS_Long_Destroy(pThis%)															:"_BS_Long_Destroy@4"
BS_Long_ToString$(pThis%)														:"_BS_Long_ToString@4"
BS_Long_FromString%(cString$)													:"_BS_Long_FromString@4"
BS_Long_FromI%(iRight%)															:"_BS_Long_FromI@4"
BS_Long_FromII%(iLeft%, iRight%)												:"_BS_Long_FromII@8"
BS_Long_ToI%(pThis%, iShift%)													:"_BS_Long_ToI@8"
BS_Long_ToIH%(pThis%)															:"_BS_Long_ToIH@4"
BS_Long_ToIL%(pThis%)															:"_BS_Long_ToIL@4"
BS_Long_FromF%(Float#)															:"_BS_Long_FromF@4"
BS_Long_ToF#(pThis%)															:"_BS_Long_ToF@4"
BS_Long_FromD(pDouble%)															:"_BS_Long_FromD@4"
BS_Long_ToD(pThis%)																:"_BS_Long_ToD@4"
BS_Long_Compare%(pThis%, pRight%)												:"_BS_Long_Compare@8"
BS_Long_Set%(pThis%, pOther%)													:"_BS_Long_Set@8"
BS_Long_Add%(pThis%, pOther%)													:"_BS_Long_Add@8"
BS_Long_Sub%(pThis%, pOther%)													:"_BS_Long_Sub@8"
BS_Long_Div%(pThis%, pOther%)													:"_BS_Long_Div@8"
BS_Long_Mul%(pThis%, pOther%)													:"_BS_Long_Mul@8"
BS_Long_Mod%(pThis%, pOther%)													:"_BS_Long_Mod@8"
BS_Long_SetI%(pThis%, iRight%)													:"_BS_Long_SetI@8"
BS_Long_AddI%(pThis%, iRight%)													:"_BS_Long_AddI@8"
BS_Long_SubI%(pThis%, iRight%)													:"_BS_Long_SubI@8"
BS_Long_DivI%(pThis%, iRight%)													:"_BS_Long_DivI@8"
BS_Long_MulI%(pThis%, iRight%)													:"_BS_Long_MulI@8"
BS_Long_ModI%(pThis%, iRight%)													:"_BS_Long_ModI@8"
BS_Long_SetII%(pThis%, iLeft%, iRight%)											:"_BS_Long_SetII@12"
BS_Long_AddII%(pThis%, iLeft%, iRight%)											:"_BS_Long_AddII@12"
BS_Long_SubII%(pThis%, iLeft%, iRight%)											:"_BS_Long_SubII@12"
BS_Long_DivII%(pThis%, iLeft%, iRight%)											:"_BS_Long_DivII@12"
BS_Long_MulII%(pThis%, iLeft%, iRight%)											:"_BS_Long_MulII@12"
BS_Long_ModII%(pThis%, iLeft%, iRight%)											:"_BS_Long_ModII@12"
BS_Long_Shift%(pThis%, iRight%)													:"_BS_Long_Shift@8"