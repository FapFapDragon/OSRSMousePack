$cur_dir = "$PSScriptRoot\"

# Define the registry path
$regPath = "HKCU:\Control Panel\Cursors"

# Set cursor values using Set-ItemProperty
Set-ItemProperty -Path $regPath -Name "AppStarting" -Value "${cur_dir}CursorAnimatedV2Merged.ani"
Set-ItemProperty -Path $regPath -Name "Arrow" -Value "${cur_dir}DScim.cur"
Set-ItemProperty -Path $regPath -Name "Crosshair" -Value "${cur_dir}Cross.cur"
Set-ItemProperty -Path $regPath -Name "Hand" -Value "${cur_dir}BarrowsGloves.cur"
Set-ItemProperty -Path $regPath -Name "Help" -Value "${cur_dir}DScimQuestionMark.cur"
Set-ItemProperty -Path $regPath -Name "IBeam" -Value "${cur_dir}TextSelect.cur"
Set-ItemProperty -Path $regPath -Name "No" -Value "${cur_dir}BankFiller.cur"
Set-ItemProperty -Path $regPath -Name "NWPen" -Value "${cur_dir}HandWriting.cur"
Set-ItemProperty -Path $regPath -Name "Person" -Value "${cur_dir}BarrowsGlovesGnomeChild.cur"
Set-ItemProperty -Path $regPath -Name "Pin" -Value "${cur_dir}BarrowsGlovesLocation.cur"
Set-ItemProperty -Path $regPath -Name "SizeAll" -Value "${cur_dir}MoveCursor.cur"
Set-ItemProperty -Path $regPath -Name "SizeNESW" -Value "${cur_dir}DiagonalResize2.cur"
Set-ItemProperty -Path $regPath -Name "SizeNS" -Value "${cur_dir}VerticalResize.cur"
Set-ItemProperty -Path $regPath -Name "SizeNWSE" -Value "${cur_dir}DiagonalResize1.cur"
Set-ItemProperty -Path $regPath -Name "SizeWE" -Value "${cur_dir}HorizontalResize.cur"
Set-ItemProperty -Path $regPath -Name "UpArrow" -Value "${cur_dir}alternativeselect.cur"
Set-ItemProperty -Path $regPath -Name "Wait" -Value "${cur_dir}VorkathSleeping.ani"

$CSharpSig = @"

[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]

public static extern bool SystemParametersInfo(

                 uint uiAction,

                 uint uiParam,

                 uint pvParam,

                 uint fWinIni);

"@

$CursorRefresh = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo -PassThru
$CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)
