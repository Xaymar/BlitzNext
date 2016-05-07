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

; Controller ------------------------------------------------------------------
BS_SteamController%()														:"_BS_SteamController@0"
BS_SteamController_Init%(pThis%, cControlConfigVDF$)						:"_BS_ISteamController_Init@8"
BS_ISteamController_Shutdown%(pThis%)										:"_BS_ISteamController_Shutdown@4"
BS_ISteamController_RunFrame(pThis%)										:"_BS_ISteamController_RunFrame@4"
BS_ISteamController_GetConnectedControllers%(pThis%, pHandles*)				:"_BS_ISteamController_GetConnectedControllers@8"
BS_ISteamController_GetConnectedControllersEx%(pThis%, pHandles%)			:"_BS_ISteamController_GetConnectedControllers@8"
BS_ISteamController_GetConnectedControllersSimple%(pThis%)					:"_BS_ISteamController_GetConnectedControllersSimple@4"
BS_ISteamController_GetConnectedControllersSimple_Index%(iIndex%)			:"_BS_ISteamController_GetConnectedControllersSimple@4"
BS_ISteamController_ShowBindingPanel%(pThis%, pController%)					:"_BS_ISteamController_ShowBindingPanel@8"
BS_ISteamController_GetActionSetHandle%(pThis%, cSetName$)					:"_BS_ISteamController_GetActionSetHandle@8"
;! Returns: ControllerActionSetHandle_t*. Clean Up!
BS_ISteamController_ActivateActionSet(pThis%, pController%, pActionSet%)	:"_BS_ISteamController_ActivateActionSet@12"
BS_ISteamController_GetCurrentActionSet%(pThis%, pController%)				:"_BS_ISteamController_GetCurrentActionSet@8"
;! Returns: ControllerActionSetHandle_t*. Clean Up!
BS_ISteamController_GetDigitalActionHandle%(pThis%, cName$)					:"_BS_ISteamController_GetDigitalActionHandle@8"
;! Returns: ControllerDigitalActionHandle_t*. Clean Up!
BS_ISteamController_GetDigitalActionData%(pThis%, pController%, pDigital%)	:"_BS_ISteamController_GetDigitalActionData@12"
;! Returns: ControllerDigitalActionData_t*. Clean Up!
BS_ISteamController_GetDigitalActionOrigins%(pThis%, pController%, pActionSet%, pDigital%, pEControllerActionOrigin*):"_BS_ISteamController_GetDigitalActionOrigins@20"
BS_ISteamController_GetDigitalActionOriginsEx%(pThis%, pController%, pActionSet%, pDigital%, pEControllerActionOrigin%):"_BS_ISteamController_GetDigitalActionOrigins@20"
BS_ISteamController_GetAnalogActionHandle%(pThis%, cName$)					:"_BS_ISteamController_GetAnalogActionHandle@8"
;! Returns: ControllerAnalogActionHandle_t*. Clean Up!
BS_ISteamController_GetAnalogActionData%(pThis%, pController%, pAnalog%)	:"_BS_ISteamController_GetAnalogActionData@12"
;! Returns: ControllerAnalogActionData_t*. Clean Up!
BS_ISteamController_GetAnalogActionOrigins%(pThis%, pController%, pActionSet%, pAnalog%, pEControllerActionOrigin*):"_BS_ISteamController_GetAnalogActionOrigins@20"
BS_ISteamController_GetAnalogActionOriginsEx%(pThis%, pController%, pActionSet%, pAnalog%, pEControllerActionOrigin*):"_BS_ISteamController_GetAnalogActionOrigins@20"
BS_ISteamController_StopAnalogActionMomentum(pThis%, pController%, pAnalog%):"_BS_ISteamController_StopAnalogActionMomentum@12"
BS_ISteamController_TriggerHapticPulse(pThis%, pController%, ESteamControllerPad%, iDuration%):"_BS_ISteamController_TriggerHapticPulse@16"
BS_ISteamController_TriggerRepeatedHapticPulse(pThis%, pController%, ESteamControllerPad%, iDuration%, iOffDuration%, iRepeats%, iFlags%):"_BS_ISteamController_TriggerRepeatedHapticPulse@28"