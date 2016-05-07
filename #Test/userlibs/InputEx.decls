.lib "User32.dll"
InputEx_User32_FindWindow%(class$, title$):"FindWindowA"
InputEx_User32_GetActiveWindow%():"GetActiveWindow"
InputEx_User32_GetCursorPosition%(point*):"GetCursorPos"
InputEx_User32_ScreenToClient%(hwnd%, point*):"ScreenToClient"
InputEx_User32_MapVirtualKeyEx%(code%, mapType%, dwhkl%):"MapVirtualKeyExA"
InputEx_User32_GetAsyncKeyState%(vkey%):"GetAsyncKeyState"

.lib " "
InputEx_Init()
InputEx_Update()
InputEx_VKeyTime%(VirtualKey%)
InputEx_VKeyDownEx%(VirtualKey%)
InputEx_VKeyDown%(VirtualKey%)
InputEx_VKeyHitEx%(VirtualKey%)
InputEx_VKeyHit%(VirtualKey%)
InputEx_KeyTime%(ScanCode%)
InputEx_KeyDownEx%(ScanCode%)
InputEx_KeyDown%(ScanCode%)
InputEx_KeyHitEx%(ScanCode%)
InputEx_KeyHit%(ScanCode%)
InputEx_MouseTime%(Button%)
InputEx_MouseDownEx%(Button%)
InputEx_MouseDown%(Button%)
InputEx_MouseHitEx%(Button%)
InputEx_MouseHit%(Button%)
KeyTime%(Key%)
KeyDownEx%(Key%)
KeyHitEx%(Key%)
MouseTime%(Button%)
MouseDownEx%(Button%)
MouseHitEx%(Button%)