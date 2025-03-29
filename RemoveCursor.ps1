$cur_dir = "$PSScriptRoot\"

# Define the registry path
$regPath = "HKCU:\Control Panel\Cursors"

# Set cursor values using Set-ItemProperty
Set-ItemProperty -Path $regPath -Name "AppStarting" -Value ""
Set-ItemProperty -Path $regPath -Name "Arrow" -Value ""
Set-ItemProperty -Path $regPath -Name "Crosshair" -Value ""
Set-ItemProperty -Path $regPath -Name "Hand" -Value ""
Set-ItemProperty -Path $regPath -Name "Help" -Value ""
Set-ItemProperty -Path $regPath -Name "IBeam" -Value ""
Set-ItemProperty -Path $regPath -Name "No" -Value ""
Set-ItemProperty -Path $regPath -Name "NWPen" -Value ""
Set-ItemProperty -Path $regPath -Name "Person" -Value ""
Set-ItemProperty -Path $regPath -Name "Pin" -Value ""
Set-ItemProperty -Path $regPath -Name "SizeAll" -Value ""
Set-ItemProperty -Path $regPath -Name "SizeNESW" -Value ""
Set-ItemProperty -Path $regPath -Name "SizeNS" -Value ""
Set-ItemProperty -Path $regPath -Name "SizeNWSE" -Value ""
Set-ItemProperty -Path $regPath -Name "SizeWE" -Value ""
Set-ItemProperty -Path $regPath -Name "UpArrow" -Value ""
Set-ItemProperty -Path $regPath -Name "Wait" -Value ""

$CSharpSig = @’

[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]

public static extern bool SystemParametersInfo(

                 uint uiAction,

                 uint uiParam,

                 uint pvParam,

                 uint fWinIni);

‘@

$CursorRefresh = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru
$CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)