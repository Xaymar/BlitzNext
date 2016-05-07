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
;	aDouble with this program.  If not, see <http:;www.gnu.org/licenses/>.

.lib "BlitzSteam.dll"
; Double ------------------------------------------------------------------------
BS_Double_New%()																:"_BS_Double_New@0"
BS_Double_Copy%(pThis%)															:"_BS_Double_Copy@4"
BS_Double_Destroy(pThis%)														:"_BS_Double_Destroy@4"
BS_Double_ToString$(pThis%)														:"_BS_Double_ToString@4"
BS_Double_FromString%(cString$)													:"_BS_Double_FromString@4"
BS_Double_FromF%(Float#)														:"_BS_Double_FromF@4"
BS_Double_ToF#(pThis%)															:"_BS_Double_ToF@4"
BS_Double_FromI%(iRight%)														:"_BS_Double_FromI@4"
BS_Double_ToI%(pThis%)															:"_BS_Double_ToI@8"
BS_Double_FromL(pDouble%)														:"_BS_Double_FromL@4"
BS_Double_ToL(pThis%)															:"_BS_Double_ToL@4"
BS_Double_Compare%(pThis%, pOther%)												:"_BS_Double_Compare@8"
BS_Double_Set%(pThis%, pOther%)													:"_BS_Double_Set@8"
BS_Double_Add%(pThis%, pOther%)													:"_BS_Double_Add@8"
BS_Double_Sub%(pThis%, pOther%)													:"_BS_Double_Sub@8"
BS_Double_Div%(pThis%, pOther%)													:"_BS_Double_Div@8"
BS_Double_Mul%(pThis%, pOther%)													:"_BS_Double_Mul@8"
BS_Double_Mod%(pThis%, pOther%)													:"_BS_Double_Mod@8"
BS_Double_SetF%(pThis%, fOther%)												:"_BS_Double_SetF@8"
BS_Double_AddF%(pThis%, fOther%)												:"_BS_Double_AddF@8"
BS_Double_SubF%(pThis%, fOther%)												:"_BS_Double_SubF@8"
BS_Double_DivF%(pThis%, fOther%)												:"_BS_Double_DivF@8"
BS_Double_MulF%(pThis%, fOther%)												:"_BS_Double_MulF@8"
BS_Double_ModF%(pThis%, fOther%)												:"_BS_Double_ModF@8"