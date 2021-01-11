$username = "YourUsername"
$password = "YourPassword"
$ie = New-Object -com InternetExplorer.Application
$ie.visible = $True
$ie.navigate("https://job.jobnet.dk/CV/frontpage")
while($ie.ReadyState -ne 4) {start-sleep -seconds 3}
$ie.document.getElementById("JobnetUsername").value= "$username"
$ie.document.getElementById("JobnetPassword").value = "$password"
$final_login = $ie.document.getElementById('LoginButton')
$final_login.click()
start-sleep 5
$final_login = $ie.document.getElementById('TjobButton')
$final_login.click()
start-sleep 5
$final_login = $ie.document.getElementById('LogoutLink')
$final_login.click()
Start-Sleep 5
$ie.quit()

#Creates the log file and logs when ever the button is pressed.
$date = Get-Date
New-Item -Path 'C:\Your\Path\Logs\Joblog.txt' -ItemType File
Add-Content -Path 'C:\Your\Path\Logs\Joblog.txt' -Value (("#$date") + " - " + "Button pressed and registreted on Jobnet.dk!")