// This is public domain. The code originates from
// https://forums3.armagetronad.net/viewtopic.php?t=3364 →
// https://github.com/docwhat/killmouseaccel

#include <IOKit/hidsystem/IOHIDLib.h>
#include <IOKit/hidsystem/IOHIDParameter.h>
#include <IOKit/hidsystem/event_status_driver.h>
#include <stdio.h>

int main() {
  const int32_t accel = -1;
  io_connect_t handle = NXOpenEventStatus();
  if (handle) {
    if (IOHIDSetParameter(handle, CFSTR(kIOHIDMouseAccelerationType), &accel,
                          sizeof accel) != KERN_SUCCESS)
      fputs("Failed to kill mouse accel", stderr);
    NXCloseEventStatus(handle);
  } else
    fputs("No handle", stderr);
  return !handle;
}
