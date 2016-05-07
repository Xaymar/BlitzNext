.lib "Kernel32.dll" 
; Mutex
Kernel32_CreateMutex%( lpMutexAttributes%, bInitialOwner%, lpName$ ) : "CreateMutexA"
Kernel32_CreateMutex2%( lpMutexAttributes%, bInitialOwner%, lpName% ) : "CreateMutexA"
Kernel32_ReleaseMutex%( hMutex% ) : "ReleaseMutex"

; Thread
Kernel32_CreateThread%( lpThreadAttributes%, dwStackSize%, lpStartAddress%, lpParameter%, dwCreationFlags%, lpThreadId% ) : "CreateThread" 
Kernel32_TerminateThread%( hThread%, dwExitCode% ) : "TerminateThread" 
Kernel32_ExitThread%( dwExitCode% ) : "ExitThread" 
Kernel32_GetExitCodeThread%( hThread% ) : "GetExitCodeThread" 
Kernel32_ResumeThread%(hThread%) : "ResumeThread"
Kernel32_SuspendThread%(hThread%) : "SuspendThread"

; Semaphorre
Kernel32_CreateSemaphore%(lpSemaphoreAttributes%, lInitialCount%, lMaximumCount%, lpName$) : "CreateSemaphoreA"
Kernel32_CreateSemaphore2%(lpSemaphoreAttributes%, lInitialCount%, lMaximumCount%, lpName%) : "CreateSemaphoreA"
Kernel32_ReleaseSemaphore%(hSemaphore%, lReleaseCount%, lpPreviousCount%) : "ReleaseSemaphore"

; Objects
Kernel32_WaitForSingleObject%( hHandle%, dwMilliseconds% ) : "WaitForSingleObject" 
Kernel32_WaitForMultipleObjects%( nCount%, lpHandles*, bWaitAll%, dwMilliseconds% ) : "WaitForMultipleObjects" 

; Other
Kernel32_CloseHandle%( hObject% ) : "CloseHandle" 
Kernel32_GetLastError%( ) : "GetLastError" 
Kernel32_FormatMessage$( dwFlags%, lpSource*, dwMessageId%, dwLanguageId%, lpBuffer$, nSize%, Arguments*) : "FormatMessage" 
Kernel32_ExitProcess( uExitCode% ) : "ExitProcess" 

.lib "User32.dll"
User32_MessageBox(hwnd%, lpText$, lpCaption$, uType%) : "MessageBoxA"