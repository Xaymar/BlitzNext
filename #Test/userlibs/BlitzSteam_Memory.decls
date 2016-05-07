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
; Memory ----------------------------------------------------------------------
BS_Memory_Alloc%(iSize%)														:"_BS_Memory_Alloc@4"
BS_Memory_ReAlloc%(pMemory%, iSize%)											:"_BS_Memory_ReAlloc@8"
BS_Memory_Free(pMemory%)														:"_BS_Memory_Free@4"
BS_Memory_PokeByte(pMemory%, iOffset%, bValue%)									:"_BS_Memory_PokeByte@12"
BS_Memory_PeekByte%(pMemory%, iOffset%)											:"_BS_Memory_PeekByte@8"
BS_Memory_PokeShort(pMemory%, iOffset%, sValue%)								:"_BS_Memory_PokeShort@12"
BS_Memory_PeekShort%(pMemory%, iOffset%)										:"_BS_Memory_PeekShort@8"
BS_Memory_PokeInt(pMemory%, iOffset%, iValue%)									:"_BS_Memory_PokeInt@12"
BS_Memory_PeekInt%(pMemory%, iOffset%)											:"_BS_Memory_PeekInt@8"
BS_Memory_PokeFloat(pMemory%, iOffset%, fValue#)								:"_BS_Memory_PokeFloat@12"
BS_Memory_PeekFloat#(pMemory%, iOffset%)										:"_BS_Memory_PeekFloat@8"
BS_Memory_PokeLong(pMemory%, iOffset%, lValue%)									:"_BS_Memory_PokeLong@12"
BS_Memory_PeekLong%(pMemory%, iOffset%)											:"_BS_Memory_PeekLong@8"
BS_Memory_PokeDouble(pMemory%, iOffset%, dValue%)								:"_BS_Memory_PokeDouble@12"
BS_Memory_PeekDouble%(pMemory%, iOffset%)										:"_BS_Memory_PeekDouble@8"
