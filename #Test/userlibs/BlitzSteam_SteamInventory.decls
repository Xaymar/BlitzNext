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

; Inventory -------------------------------------------------------------------
BS_SteamInventory%()															:"_BS_SteamInventory@0"
BS_SteamGameServerInventory%()													:"_BS_SteamGameServerInventory@0"
BS_ISteamInventory_GetResultStatus%(pThis%, iResultHandle%)						:"_BS_ISteamInventory_GetResultStatus@8"
BS_ISteamInventory_GetResultItems%(pThis%, iResultHandle%, pItemsArray*, piItemsArraySize*):"_BS_ISteamInventory_GetResultItems@16"
BS_ISteamInventory_GetResultItemsEx%(pThis%, iResultHandle%, pItemsArray%, piItemsArraySize%):"_BS_ISteamInventory_GetResultItems@16"
BS_ISteamInventory_GetResultTimestamp%(pThis%, iResultHandle%)					:"_BS_ISteamInventory_GetResultTimestamp@8"
BS_ISteamInventory_CheckResultSteamID%(pThis%, iResultHandle%, lSteamIdExpected%):"_BS_ISteamInventory_GetResultTimestamp@12"
BS_ISteamInventory_DestroyResult(pThis%, iResultHandle%)						:"_BS_ISteamInventory_DestroyResult@8"
BS_ISteamInventory_GetAllItems%(pThis%, piResultHandle*)						:"_BS_ISteamInventory_GetAllItems@8"
BS_ISteamInventory_GetAllItemsEx%(pThis%, piResultHandle%)						:"_BS_ISteamInventory_GetAllItems@8"
BS_ISteamInventory_GetItemsByID%(pThis%, piResultHandle*, plInstanceIds*, iInstanceIdCount%):"_BS_ISteamInventory_GetItemsByID@16"
BS_ISteamInventory_GetItemsByIDEx%(pThis%, piResultHandle%, plInstanceIds%, iInstanceIdCount%):"_BS_ISteamInventory_GetItemsByID@16"
BS_ISteamInventory_SerializeResult%(pThis%, iResultHandle%, pOutBuffer*, piOutBufferSize*):"_BS_ISteamInventory_SerializeResult@16"
BS_ISteamInventory_SerializeResultEx%(pThis%, iResultHandle%, pOutBuffer%, piOutBufferSize%):"_BS_ISteamInventory_SerializeResult@16"
BS_ISteamInventory_DeserializeResult%(pThis%, piResultHandle*, pBuffer*, iBufferSize%, bReservedMustBeFalse):"_BS_ISteamInventory_DeserializeResult@20"
BS_ISteamInventory_DeserializeResultEx%(pThis%, piResultHandle%, pBuffer%, iBufferSize%, bReservedMustBeFalse):"_BS_ISteamInventory_DeserializeResult@20"
BS_ISteamInventory_GenerateItems%(pThis%, piResultHandle*, piIdArray*, piQuantityArray*, iArrayLength%):"_BS_ISteamInventory_GenerateItems@20"
BS_ISteamInventory_GenerateItemsEx%(pThis%, piResultHandle%, piIdArray%, piQuantityArray%, iArrayLength%):"_BS_ISteamInventory_GenerateItems@20"
BS_ISteamInventory_GrantPromoItems%(pThis%, piResultHandle*)					:"_BS_ISteamInventory_GrantPromoItems@8"
BS_ISteamInventory_GrantPromoItemsEx%(pThis%, piResultHandle%)					:"_BS_ISteamInventory_GrantPromoItems@8"
BS_ISteamInventory_AddPromoItem%(pThis%, piResultHandle*, iId%)					:"_BS_ISteamInventory_AddPromoItem@12"
BS_ISteamInventory_AddPromoItemEx%(pThis%, piResultHandle%, iId%)				:"_BS_ISteamInventory_AddPromoItem@12"
BS_ISteamInventory_AddPromoItems%(pThis%, piResultHandle*, piIdsArray*, iArrayLength%):"_BS_ISteamInventory_AddPromoItems@16"
BS_ISteamInventory_AddPromoItemsEx%(pThis%, piResultHandle%, piIdsArray%, iArrayLength%):"_BS_ISteamInventory_AddPromoItems@16"
BS_ISteamInventory_ConsumeItem%(pThis%, piResultHandle*, iId%, iQuantity%)		:"_BS_ISteamInventory_ConsumeItem@16"
BS_ISteamInventory_ConsumeItemEx%(pThis%, piResultHandle%, iId%, iQuantity%)	:"_BS_ISteamInventory_ConsumeItem@16"
BS_ISteamInventory_ExchangeItems%(pThis%, piResultHandle*, piGenerateArray*, piGenerateQuantityArray*, iArrayGenerateLength%, piDestroyArray*, piDestroyQuantityArray*, iArrayDestroyLength%):"_BS_ISteamInventory_ExchangeItems@32"
BS_ISteamInventory_ExchangeItemsEx%(pThis%, piResultHandle%, piGenerateArray%, piGenerateQuantityArray%, iArrayGenerateLength%, piDestroyArray%, piDestroyQuantityArray%, iArrayDestroyLength%):"_BS_ISteamInventory_ExchangeItems@32"
BS_ISteamInventory_TransferItemQuantity%(pThis%, piResultHandle*, iSourceId%, iQuantity%, iDestId%):"_BS_ISteamInventory_TransferItemQuantity@20"
BS_ISteamInventory_TransferItemQuantityEx%(pThis%, piResultHandle%, iSourceId%, iQuantity%, iDestId%):"_BS_ISteamInventory_TransferItemQuantity@20"
BS_ISteamInventory_SendItemDropHeartbeat%(pThis%)								:"_BS_ISteamInventory_SendItemDropHeartbeat@4"
BS_ISteamInventory_TriggerItemDrop%(pThis%, piResultHandle*, iDropListId%)		:"_BS_ISteamInventory_TriggerItemDrop@12"
BS_ISteamInventory_TriggerItemDropEx%(pThis%, piResultHandle%, iDropListId%)	:"_BS_ISteamInventory_TriggerItemDrop@12"
BS_ISteamInventory_TradeItems%(pThis%, piResultHandle*, lSteamIdPartner%, piArrayGive*, piArrayGiveQuantity*, iArrayGiveLength%, piArrayGet*, piArrayGetQuantity*, iArrayGetLength%):"_BS_ISteamInventory_TradeItems@36"
BS_ISteamInventory_TradeItemsEx%(pThis%, piResultHandle%, lSteamIdPartner%, piArrayGive%, piArrayGiveQuantity%, iArrayGiveLength%, piArrayGet%, piArrayGetQuantity%, iArrayGetLength%):"_BS_ISteamInventory_TradeItems@36"
BS_ISteamInventory_LoadItemDefinitions%(pThis%)									:"_BS_ISteamInventory_LoadItemDefinitions@4"
BS_ISteamInventory_GetItemDefinitionIDs%(pThis%, piArrayId*, piArrayIdSize*)	:"_BS_ISteamInventory_GetItemDefinitionIDs@12"
BS_ISteamInventory_GetItemDefinitionIDsEx%(pThis%, piArrayId%, piArrayIdSize%)	:"_BS_ISteamInventory_GetItemDefinitionIDs@12"
BS_ISteamInventory_GetItemDefinitionProperty%(pThis%, iId%, cName$, pcValueBuffer*, piValueBufferSize*):"_BS_ISteamInventory_GetItemDefinitionProperty@20"
BS_ISteamInventory_GetItemDefinitionPropertyEx%(pThis%, iId%, cName$, pcValueBuffer%, piValueBufferSize%):"_BS_ISteamInventory_GetItemDefinitionProperty@20"