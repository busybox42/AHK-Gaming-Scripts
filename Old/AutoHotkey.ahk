#ifWinActive World of Warcraft 
{
    $3::
    Loop 
    {
        if not GetKeyState("3", "P")
        break
        Send 34 
        sleep 1
    }
    return
    $4::
    Loop 
    {
        if not GetKeyState("4", "P")
        break
        Send 4 
        sleep 1
    }
    return
}


