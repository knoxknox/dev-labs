#include <iostream>
#include <Windows.h>

// Open target process
// Allocate memory for the dllPath in the target process
// Write path to the address of the memory we just allocated
// Remote Thread calls LoadLibraryA in the target process (loads our dll)
//
// Wait for the execution of our loader thread to finish, free allocated memory
int main()
{
  LPCSTR dllPath = "C:\\example.dll";

  HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, 17344);
  LPVOID pDllPath = VirtualAllocEx(hProcess, 0, strlen(dllPath) + 1, MEM_COMMIT, PAGE_READWRITE);

  WriteProcessMemory(hProcess, pDllPath, (LPVOID)dllPath, strlen(dllpath) + 1, 0);
  HANDLE hLoadThread = CreateRemoteThread(hProcess, 0, 0,
    (LPTHREAD_START_ROUTINE)GetProcAddress(GetModuleHandleA("Kernel32.dll"), "LoadLibraryA"), pDllPath, 0, 0);

  WaitForSingleObject(hLoadThread, INFINITE);
  std::cout << "Allocated at:" << std::hex << pDllPath << std::endl;

  std::cin.get();
  VirtualFreeEx(hProcess, pDllPath, strlen(dllPath) + 1, MEM_RELEASE);

  return 0;
}
