;	BlitzUtility - Expanding the normal Blitz functionality.
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

.lib "BlitzUtility.dll"
; Container -------------------------------------------------------------------
; -- List (Single Element)
BU_List_Create%(element*)
BU_List_Destroy%(list%)
BU_List_First%(list%)
BU_List_Last%(list%)
BU_List_Previous%(list%)
BU_List_Next%(list%)
BU_List_Before%(list%, other*)
BU_List_After%(list%, other*)
BU_List_Insert(list%, element*)
BU_List_InsertEx(list%, element*, other*)
BU_List_Remove(list%, element*)
; -- TypeList (Single Type)
BU_TypeList_Create%(obj*)
BU_TypeList_Activate(list%)
BU_TypeList_Deactivate(list%)
BU_TypeList_Destroy(list%)

; Database --------------------------------------------------------------------
; -- SQLite3
; Core
BU_SQLite_Version$()
BU_SQLite_Version_Number%()
BU_SQLite_SourceID$()
BU_SQLite_CompileOption_Used%(zOptName$)
BU_SQLite_CompileOption_Get$(n%)
BU_SQLite_ThreadSafe%()
BU_SQLite_Initialize%()
BU_SQLite_Shutdown%()
BU_SQLite_Sleep%(ms%)
; Open & Close
BU_SQLite_Open%(file$, db*)
BU_SQLite_Open_V2%(file$, db*, flags%, zVfs$)
BU_SQLite_Open_V2Ex%(file$, db*, flags%, zVfs%) : "BU_SQLite_Open_V2"
BU_SQLite_Close%(db%)
BU_SQLite_Close_V2%(db%)
BU_SQLite_OpenSimple%(file$)
BU_SQLite_OpenSimple_V2%(file$, flags%, zVfs$)
BU_SQLite_OpenSimple_V2Ex%(file$, flags%, zVfs%) : "BU_SQLite_OpenSimple_V2"
BU_SQLite_OpenSimpleError%()
; Error Handling
BU_SQLite_Error_Code%(db%)
BU_SQLite_Extended_Error_Code%(db%)
BU_SQLite_Error_Message$(db%)
BU_SQLite_Error_String$(errorCode%)
BU_SQLite_Extended_Result_Codes%(db%, onoff%)
; Busy Handler
BU_SQLite_Busy_Timeout%(db%, timeout%)
BU_SQLite_Busy_Handler%(db%, pHandlerFunction3IPI%, param%)
BU_SQLite_Busy_Handler_Simple%(db%, pHandlerFunc2II%)
; Memory Management
BU_SQLite_Memory_Used%()
BU_SQLite_Memory_Highwater%(bReset%)
BU_SQLite_Release_Memory%(bytes%)
BU_SQLite_DB_Release_Memory%(db%)
BU_SQLite_Randomness(n%, pBank*)
; Database Management & Modification
BU_SQLite_Exec%(db%, sql$, pCallback3PIPP%, param%, errMsg*)
BU_SQLite_ExecEx%(db%, sql$, pCallback3PIPP%, param%, errMsg%) : "BU_SQLite_Exec"
BU_SQLite_Last_Insert_RowId%(db%)
BU_SQLite_Changes%(db%)
BU_SQLite_Total_Changes%(db%)
BU_SQLite_Interrupt(db%)
BU_SQLite_Complete%(sql$)
BU_SQLite_Get_Table%(db, zSql$, pazResult*, pnRow*, pnColumn*, pzErrMessage*)
BU_SQLite_Free_Table%(result*)
BU_SQLite_Set_Authorizer%(db%, pAuth5PIPPPP, pArg%)
BU_SQLite_Trace%(db%, pTrace1PP, pArg%)
BU_SQLite_Profile%(db%, pProfile2PPI, pArg%)
BU_SQLite_Progress_Handler%(db%, nOps%, pProgress1IP%, pArg%)
BU_SQLite_URI_Parameter$(zFilename$, zParam$)
BU_SQLite_URI_Boolean%(zFilename$, zParam$, bDefault%)
BU_SQLite_URI_LongLong%(zFilename$, zParam$, bDefault%)
BU_SQLite_Limit%(db%, id%, newVal%)
; Prepared Statements
BU_SQLite_Next_Statement%(db%, pStmt%)
BU_SQLite_Prepare%(db%, zSql$, nByte%, ppStmt*)
BU_SQLite_PrepareEx%(db%, zSql$, nByte%, ppStmt%) : "BU_SQLite_Prepare"
BU_SQLite_Prepare_V2%(db%, zSql$, nByte%, ppStmt*)
BU_SQLite_Prepare_V2Ex%(db%, zSql$, nByte%, ppStmt%) : "BU_SQLite_Prepare_V2"
BU_SQLite_Statement_ReadOnly%(pStmt%)
BU_SQLite_Statement_Busy%(pStmt%)
BU_SQLite_Statement_Status%(pStmt%, op%, resetFlag%)
BU_SQLite_SQL$(pStmt%)
BU_SQLite_Database_Handle%(pStmt%)
BU_SQLite_Bind_Null%(pStmt%, index%)
BU_SQLite_Bind_Int%(pStmt%, index%, value%)
BU_SQLite_Bind_LongLong%(pStmt%, index%, pValue%)
BU_SQLite_Bind_Float%(pStmt%, index%, value#)
BU_SQLite_Bind_Double%(pStmt%, index%, pValue%)
BU_SQLite_Bind_Text%(pStmt%, index%, zData$, nData%)
BU_SQLite_Bind_Blob%(pStmt%, index%, zData$, nData%)
BU_SQLite_Bind_Value%(pStmt%, index%, pValue%)
BU_SQLite_Bind_ZeroBlob%(pStmt%, index%, bytes%)
BU_SQLite_Bind_Parameter_Count%(pStmt%)
BU_SQLite_Bind_Parameter_Name$(pStmt%, index%)
BU_SQLite_Bind_Parameter_Index%(pStmt%, zName$)
BU_SQLite_Clear_Bindings%(pStmt%)
BU_SQLite_Column_Count%(pStmt%)
BU_SQLite_Column_Name$(pStmt%, index%)
BU_SQLite_Column_DeclaredType$(pStmt%, index%)
BU_SQLite_Step%(pStmt%)
BU_SQLite_Data_Count%(pStmt%)
BU_SQLite_Column_Blob%(pStmt%, iCol%)
BU_SQLite_Column_Bytes%(pStmt%, iCol%)
BU_SQLite_Column_Float%(pStmt%, iCol%)
BU_SQLite_Column_Double%(pStmt%, iCol%)
BU_SQLite_Column_Int%(pStmt%, iCol%)
BU_SQLite_Column_LongLong%(pStmt%, iCol%)
BU_SQLite_Column_Text$(pStmt%, iCol%)
BU_SQLite_Column_Value%(pStmt%, iCol%)
BU_SQLite_Column_Type%(pStmt%, iCol%)
BU_SQLite_Finalize%(pStmt%)
BU_SQLite_Reset%(pStmt%)
; SQLite Values
BU_SQLite_Value_Blob%(pValue%)
BU_SQLite_Value_Bytes%(pValue%)
BU_SQLite_Value_Int%(pValue%)
BU_SQLite_Value_LongLong%(pValue%)
BU_SQLite_Value_Float#(pValue%)
BU_SQLite_Value_Double%(pValue%)
BU_SQLite_Value_Text$(pValue%)
BU_SQLite_Value_Type%(pValue%)
BU_SQLite_Value_Numeric_Type%(pValue%)
BU_SQLite_Value_SubType%(pValue%)
BU_SQLite_Value_Duplicate%(pValue%)
BU_SQLite_Value_Free(pValue%)

; Time ------------------------------------------------------------------------
; -- Time
BU_Time_Now%()
BU_Time_Create%(seconds%, minutes%, hours%, days%, months%, years%, isDST%)
BU_Time_Destroy(pTime%)
BU_Time_Format$(pTime%, formatString$)
; -- Timer
BU_Timer_Create%(Interval%, hwnd%) : "_BU_Timer_Create@8"
BU_Timer_Destroy%(Timer%) : "_BU_Timer_Destroy@4"
BU_Timer_Wait%(Timer%) : "_BU_Timer_Wait@4"
; -- SystemClock
BU_SystemClock_Now%()
BU_SystemClock_Destroy(pSystemClock%)
BU_SystemClock_FromTime%(pTime%)
BU_SystemClock_AsTime%(pSystemClock%)
; -- HighResolutionClock
BU_HighResolutionClock_Now%()
BU_HighResolutionClock_Destroy(pHighResolutionClock%)
BU_HighResolutionClock_Duration%(pHighResolutionClock%, pOther%)
BU_HighResolutionClock_DurationLL%(pHighResolutionClock%, pOther%)
BU_HighResolutionClock_DurationF#(pHighResolutionClock%, pOther%)
BU_HighResolutionClock_DurationD%(pHighResolutionClock%, pOther%)

; Types - Long ----------------------------------------------------------------
BU_Long_New%()																	:"_BU_Long_New@0"
BU_Long_Copy%(pThis%)															:"_BU_Long_Copy@4"
BU_Long_Destroy(pThis%)															:"_BU_Long_Destroy@4"
BU_Long_ToString$(pThis%)														:"_BU_Long_ToString@4"
BU_Long_FromString%(cString$)													:"_BU_Long_FromString@4"
BU_Long_FromI%(iRight%)															:"_BU_Long_FromI@4"
BU_Long_FromII%(iLeft%, iRight%)												:"_BU_Long_FromII@8"
BU_Long_ToI%(pThis%, iShift%)													:"_BU_Long_ToI@8"
BU_Long_ToIH%(pThis%)															:"_BU_Long_ToIH@4"
BU_Long_ToIL%(pThis%)															:"_BU_Long_ToIL@4"
BU_Long_FromF%(Float#)															:"_BU_Long_FromF@4"
BU_Long_ToF#(pThis%)															:"_BU_Long_ToF@4"
BU_Long_FromD(pDouble%)															:"_BU_Long_FromD@4"
BU_Long_ToD(pThis%)																:"_BU_Long_ToD@4"
BU_Long_Compare%(pThis%, pRight%)												:"_BU_Long_Compare@8"
BU_Long_Set%(pThis%, pOther%)													:"_BU_Long_Set@8"
BU_Long_Add%(pThis%, pOther%)													:"_BU_Long_Add@8"
BU_Long_Sub%(pThis%, pOther%)													:"_BU_Long_Sub@8"
BU_Long_Div%(pThis%, pOther%)													:"_BU_Long_Div@8"
BU_Long_Mul%(pThis%, pOther%)													:"_BU_Long_Mul@8"
BU_Long_Mod%(pThis%, pOther%)													:"_BU_Long_Mod@8"
BU_Long_SetI%(pThis%, iRight%)													:"_BU_Long_SetI@8"
BU_Long_AddI%(pThis%, iRight%)													:"_BU_Long_AddI@8"
BU_Long_SubI%(pThis%, iRight%)													:"_BU_Long_SubI@8"
BU_Long_DivI%(pThis%, iRight%)													:"_BU_Long_DivI@8"
BU_Long_MulI%(pThis%, iRight%)													:"_BU_Long_MulI@8"
BU_Long_ModI%(pThis%, iRight%)													:"_BU_Long_ModI@8"
BU_Long_SetII%(pThis%, iLeft%, iRight%)											:"_BU_Long_SetII@12"
BU_Long_AddII%(pThis%, iLeft%, iRight%)											:"_BU_Long_AddII@12"
BU_Long_SubII%(pThis%, iLeft%, iRight%)											:"_BU_Long_SubII@12"
BU_Long_DivII%(pThis%, iLeft%, iRight%)											:"_BU_Long_DivII@12"
BU_Long_MulII%(pThis%, iLeft%, iRight%)											:"_BU_Long_MulII@12"
BU_Long_ModII%(pThis%, iLeft%, iRight%)											:"_BU_Long_ModII@12"
BU_Long_Shift%(pThis%, iRight%)													:"_BU_Long_Shift@8"

; Double ------------------------------------------------------------------------
BU_Double_New%()																:"_BU_Double_New@0"
BU_Double_Copy%(pThis%)															:"_BU_Double_Copy@4"
BU_Double_Destroy(pThis%)														:"_BU_Double_Destroy@4"
BU_Double_ToString$(pThis%)														:"_BU_Double_ToString@4"
BU_Double_FromString%(cString$)													:"_BU_Double_FromString@4"
BU_Double_FromF%(Float#)														:"_BU_Double_FromF@4"
BU_Double_ToF#(pThis%)															:"_BU_Double_ToF@4"
BU_Double_FromI%(iRight%)														:"_BU_Double_FromI@4"
BU_Double_ToI%(pThis%)															:"_BU_Double_ToI@8"
BU_Double_FromL(pDouble%)														:"_BU_Double_FromL@4"
BU_Double_ToL(pThis%)															:"_BU_Double_ToL@4"
BU_Double_Compare%(pThis%, pOther%)												:"_BU_Double_Compare@8"
BU_Double_Set%(pThis%, pOther%)													:"_BU_Double_Set@8"
BU_Double_Add%(pThis%, pOther%)													:"_BU_Double_Add@8"
BU_Double_Sub%(pThis%, pOther%)													:"_BU_Double_Sub@8"
BU_Double_Div%(pThis%, pOther%)													:"_BU_Double_Div@8"
BU_Double_Mul%(pThis%, pOther%)													:"_BU_Double_Mul@8"
BU_Double_Mod%(pThis%, pOther%)													:"_BU_Double_Mod@8"
BU_Double_SetF%(pThis%, fOther%)												:"_BU_Double_SetF@8"
BU_Double_AddF%(pThis%, fOther%)												:"_BU_Double_AddF@8"
BU_Double_SubF%(pThis%, fOther%)												:"_BU_Double_SubF@8"
BU_Double_DivF%(pThis%, fOther%)												:"_BU_Double_DivF@8"
BU_Double_MulF%(pThis%, fOther%)												:"_BU_Double_MulF@8"
BU_Double_ModF%(pThis%, fOther%)												:"_BU_Double_ModF@8"

; Utility ---------------------------------------------------------------------
; -- Display Enumerator
BU_DisplayEnumerator_Create%()													:"_BU_DisplayEnumerator_Create@0"
BU_DisplayEnumerator_Destroy(DisplayEnumerator%)								:"_BU_DisplayEnumerator_Destroy@4"
BU_DisplayEnumerator_Enumerate%(DisplayEnumerator%)								:"_BU_DisplayEnumerator_Enumerate@4"
BU_DisplayEnumerator_Count%(DisplayEnumerator%)									:"_BU_DisplayEnumerator_Count@4"
BU_DisplayEnumerator_Retrieve(DisplayEnumerator%, index%, Rect*)				:"_BU_DisplayEnumerator_Retrieve@12"
; -- Indexer V1 (Array)
BU_IndexerV1_Create%()
BU_IndexerV1_Destroy(Indexer%)
BU_IndexerV1_Mark(Indexer%, Used%)
BU_IndexerV1_MarkFree(Indexer%)
BU_IndexerV1_MarkUsed(Indexer%)
BU_IndexerV1_Is%(Indexer%, Used%)
BU_IndexerV1_IsFree%(Indexer%)
BU_IndexerV1_IsUsed%(Indexer%)
BU_IndexerV1_Get%(Indexer%)
BU_IndexerV1_Count%(Indexer%, Used%)
BU_IndexerV1_CountFree%(Indexer%)
BU_IndexerV1_CountUsed%(Indexer%)
; -- Indexer V2 (List)
BU_IndexerV2_Create%()
BU_IndexerV2_Destroy(Indexer%)
BU_IndexerV2_Mark(Indexer%, Used%)
BU_IndexerV2_MarkFree(Indexer%)
BU_IndexerV2_MarkUsed(Indexer%)
BU_IndexerV2_Is%(Indexer%, Used%)
BU_IndexerV2_IsFree%(Indexer%)
BU_IndexerV2_IsUsed%(Indexer%)
BU_IndexerV2_Get%(Indexer%)
BU_IndexerV2_Count%(Indexer%, Used%)
BU_IndexerV2_CountFree%(Indexer%)
BU_IndexerV2_CountUsed%(Indexer%)
; -- Mass Operation
BU_MassOp_Create%(length%)
BU_MassOp_Destroy(massop%)
BU_MassOp_Instruction(massop%, index%, type%, code%, leftOperand%, rightOperand%, result%)
BU_MassOp_Run(massop%)
; -- Window Message Handler
BU_WindowMessageHandler_Install(hwnd%)
BU_WindowMessageHandler_Uninstall(hwnd%)
BU_WindowMessageHandler_Message_Close%(hwnd%)
BU_WindowMessageHandler_Message_Destroy%(hwnd%)
BU_WindowMessageHandler_Message_Resize%(hwnd%, point*)

; Helpers ---------------------------------------------------------------------
.lib " "
; -- Blitz Functions
BU_Helper_Window_LockPointer(HWND%)
BU_Helper_Window_LockPointerAuto(HWND%)
BU_Helper_Window_MakeBorderless(HWND%)
BU_Helper_Window_Center(HWND%, Monitor%)
BU_Helper_Window_Fill(HWND%, Monitor%)
; -- Windows API (User32)
.lib "User32.dll"
BU_User32_ClientToScreen%(hwnd%, point*)										: "ClientToScreen"
BU_User32_ClientToScreenEx%(hwnd%, point%)										: "ClientToScreen"
BU_User32_ClipCursor%(rect*)													: "ClipCursor"
BU_User32_ClipCursorEx%(ptr%)													: "ClipCursor"
BU_User32_GetActiveWindow%()													: "GetActiveWindow"
BU_User32_GetSystemMetrics%(index%)												: "GetSystemMetrics"
BU_User32_SetWindowLong%(hwnd%, nIndex%, dwNewLong%)							: "SetWindowLongA"
BU_User32_GetWindowLong%(hwnd%, index%)											: "GetWindowLongA"
BU_User32_GetWindowRect%(hwnd%, rect*)											: "GetWindowRect"
BU_User32_GetWindowRectEx%(hwnd%, rect%)										: "GetWindowRect"
BU_User32_GetClientRect%(hwnd%, rect*)											: "GetClientRect"
BU_User32_GetClientRectEx%(hwnd%, rect%)										: "GetClientRect"
BU_User32_SetWindowPos%(hwnd%, hWndInsertAfter%, x%, y%, cx%, cy%, wFlags%)		: "SetWindowPos" 
BU_User32_MessageBox%(hwnd%, lpText$, lpCaption$, uType%)						: "MessageBoxA"
; -- Windows API (Kernel32)
.lib "Kernel32.dll"
BU_Kernel32_FlushFileBuffers%(hFile%)											: "FlushFileBuffers"
FlushFile%(hFile%)																: "FlushFileBuffers"
BU_Kernel32_QueryPerformanceCounter%(pLongLong%)								: "QueryPerformanceCounter"
BU_Kernel32_QueryPerformanceFrequency%(pLongLong%)								: "QueryPerformanceFrequency"