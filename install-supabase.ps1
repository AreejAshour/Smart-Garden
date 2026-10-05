# Create Supabase directory if it doesn't exist
$supabaseDir = "$env:USERPROFILE\.supabase"
if (-not (Test-Path $supabaseDir)) {
    New-Item -ItemType Directory -Force -Path $supabaseDir
}

# Download Supabase CLI
$ProgressPreference = 'SilentlyContinue'
$url = "https://github.com/supabase/cli/releases/latest/download/supabase_windows_amd64.exe"
$output = "$supabaseDir\supabase.exe"
Invoke-WebRequest -Uri $url -OutFile $output

# Add to PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if (-not $currentPath.Contains($supabaseDir)) {
    [Environment]::SetEnvironmentVariable("Path", $currentPath + ";$supabaseDir", [EnvironmentVariableTarget]::User)
    $env:Path += ";$supabaseDir"
}

Write-Host "Supabase CLI has been installed successfully!"
Write-Host "Please restart your terminal to use the 'supabase' command." 