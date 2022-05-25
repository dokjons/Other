$envusr = $env:USERNAME
$url = Read-Host -Prompt 'Enter your wallpaper url'
$filename = "C:\Users\$envusr\Downloads\wallpaper.jpg"
Function Set-WallPaper($Value)
{
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name wallpaper -Value $Value
rundll32.exe user32.dll, UpdatePerUserSystemParameters
}
function getfile($url, $filename)
{
    $wc = New-Object System.Net.WebClient
    try
    {
        $wc.DownloadFile($url, $filename)
    }
    catch [System.Net.WebException]
    {
        Write-Host("Kan ikke download $url")
    }
    finally
    {
        Set-WallPaper -Value "C:\Users\$envusr\Downloads\wallpaper.jpg"
    }
}
getfile $url $filename | Out-Null