#Requires AutoHotkey v1.1.0+
;==============================================================
; UserNotificationStateUtils — SHQueryUserNotificationState wrapper + enum name helper
;
; GitHub: https://github.com/SevenKeyboard/user-notification-state-utils
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
class VersionManager_UserNotificationStateUtils
{
    static _ := VersionManager_UserNotificationStateUtils._init()
    _init()    {
        global
        USERNOTIFICATIONSTATEUTILS_VERSION := "1.0.0"
    }
}
getUserNotificationState()    {
    static S_OK:=0x00000000
    return dllCall("Shell32\SHQueryUserNotificationState", "Ptr*",pquns, "Int")==S_OK?pquns:false
}
getUserNotificationStateEnum()    {
    static enum:=["QUNS_NOT_PRESENT","QUNS_BUSY","QUNS_RUNNING_D3D_FULL_SCREEN","QUNS_PRESENTATION_MODE","QUNS_ACCEPTS_NOTIFICATIONS","QUNS_QUIET_TIME","QUNS_APP"]
    return (enum.hasKey(state:=getUserNotificationState())?enum[state]:"")
}