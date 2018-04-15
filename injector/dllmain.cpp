#include <Windows.h>

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved)
{
  if (reason == DLL_PROCESS_ATTACH)
    MessageBox(0, L"DLL code injected", L"Injection", MB_ICONINFORMATION);

  return TRUE;
}
