# latale-price 一键安装（Windows PowerShell）
# 用法: powershell -ExecutionPolicy Bypass -File install.ps1
$ErrorActionPreference = "Stop"

$RepoRoot = $PSScriptRoot
$DshHome  = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $HOME ".dsh" }
$Dest     = Join-Path $DshHome "skills\latale-price"
$Src      = Join-Path $RepoRoot "skills\latale-price"

if (-not (Test-Path $Src)) { Write-Error "找不到 skill 源目录: $Src"; exit 1 }

New-Item -ItemType Directory -Force -Path $Dest | Out-Null
Copy-Item -Path (Join-Path $Src "*") -Destination $Dest -Recurse -Force

Write-Host "已安装 latale-price skill 到:"
Write-Host "  $Dest"
Write-Host "重开会话即可使用。"
