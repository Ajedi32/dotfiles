# Installs profile.ps1 to the right place on the filesystem

if (Test-Path -Path $PROFILE.CurrentUserAllHosts) {
  Write-Output "Profile already exists. Please merge manually."
  Invoke-Item $PROFILE.CurrentUserAllHosts
  Invoke-Item "$PSScriptRoot\profile.ps1"
} else {
  New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force | Out-Null
  Copy-Item "$PSScriptRoot\profile.ps1" $PROFILE.CurrentUserAllHosts
  Write-Output "profile.ps1 installed successfully"
}
