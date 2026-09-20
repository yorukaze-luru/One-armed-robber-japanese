Add-Type -AssemblyName System.Windows.Forms

function Show-Msg([string]$text, [string]$title, [int]$icon) {
    [System.Windows.Forms.MessageBox]::Show($text, $title, [System.Windows.Forms.MessageBoxButtons]::OK, $icon)
}

$baseDir = $PSScriptRoot
if (-not $baseDir) { $baseDir = (Get-Location).Path }

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  One-armed robber 日本語化パッチ アンインストーラー" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$targetDir = $null

if (Test-Path -LiteralPath (Join-Path $baseDir "OAR.exe")) {
    $targetDir = $baseDir
}

if (-not $targetDir) {
    $dtPath = Join-Path ([Environment]::GetFolderPath("Desktop")) "One-armed robber"
    if (Test-Path -LiteralPath (Join-Path $dtPath "OAR.exe")) {
        $targetDir = $dtPath
    }
}

if (-not $targetDir) {
    $steamDefault = "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber"
    if (Test-Path -LiteralPath (Join-Path $steamDefault "OAR.exe")) {
        $targetDir = $steamDefault
    }
}

if (-not $targetDir) {
    $drives = "D","E","F","G"
    foreach ($d in $drives) {
        $candidate = "$($d):\SteamLibrary\steamapps\common\One-armed robber"
        if (Test-Path -LiteralPath (Join-Path $candidate "OAR.exe")) {
            $targetDir = $candidate
            break
        }
    }
}

if (-not $targetDir) {
    Write-Host "ゲームのインストール先を自動検出できませんでした。" -ForegroundColor Yellow
    Write-Host "『One-armed robber』のインストールフォルダのパスを入力してください:"
    $inputPath = Read-Host "フォルダパス"
    $inputPath = $inputPath.Trim('"').Trim("'")
    if (Test-Path -LiteralPath (Join-Path $inputPath "OAR.exe")) {
        $targetDir = $inputPath
    } else {
        Write-Host "[エラー] 指定されたフォルダに OAR.exe が見つかりませんでした。" -ForegroundColor Red
        Read-Host
        exit 1
    }
}

$pakFile = Join-Path $targetDir "OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak"

if (Test-Path -LiteralPath $pakFile) {
    Remove-Item -LiteralPath $pakFile -Force
    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host "  日本語化パッチを削除しました。" -ForegroundColor Green
    Write-Host "  ゲームは元の英語状態に戻りました。" -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host ""
    Show-Msg "日本語化パッチの削除が完了しました。`n`nゲームは元の英語状態に戻りました。" "One-armed robber 日本語化パッチ" 64
} else {
    Write-Host ""
    Write-Host "[案内] 日本語化パッチファイルは見つかりませんでした。（すでに削除されています）" -ForegroundColor Yellow
    Write-Host ""
    Show-Msg "日本語化パッチファイルは見つかりませんでした。`nすでに元の英語状態に戻っています。" "One-armed robber 日本語化パッチ" 64
}

Write-Host "Enterキーを押してウィンドウを閉じてください..."
Read-Host