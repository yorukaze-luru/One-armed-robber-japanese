Add-Type -AssemblyName System.Windows.Forms

function Show-Msg([string]$text, [string]$title, [int]$icon) {
    [System.Windows.Forms.MessageBox]::Show($text, $title, [System.Windows.Forms.MessageBoxButtons]::OK, $icon)
}

$baseDir = $PSScriptRoot
if (-not $baseDir) { $baseDir = (Get-Location).Path }

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  One-armed robber 日本語化パッチ 自動インストーラー" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$patchPak = Join-Path $baseDir "OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak"

if (-not (Test-Path -LiteralPath $patchPak)) {
    Write-Host "[エラー] パッチ本体が見つかりません。" -ForegroundColor Red
    Write-Host "解凍したフォルダの構成を変更せずに実行してください。" -ForegroundColor Red
    Show-Msg "パッチ本体（OAR-WindowsNoEditor_Japanese_P.pak）が見つかりません。`n解凍したフォルダの構成を変更せずに実行してください。" "エラー" 16
    Write-Host ""
    Write-Host "Enterキーを押して終了してください..."
    Read-Host
    exit 1
}

# 検出対象
$targetDir = $null

# 1. 同じフォルダ
if (Test-Path -LiteralPath (Join-Path $baseDir "OAR.exe")) {
    $targetDir = $baseDir
}

# 2. デスクトップ
if (-not $targetDir) {
    $dtPath = Join-Path ([Environment]::GetFolderPath("Desktop")) "One-armed robber"
    if (Test-Path -LiteralPath (Join-Path $dtPath "OAR.exe")) {
        $targetDir = $dtPath
    }
}

# 3. Steam標準
if (-not $targetDir) {
    $steamDefault = "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber"
    if (Test-Path -LiteralPath (Join-Path $steamDefault "OAR.exe")) {
        $targetDir = $steamDefault
    }
}

# 4. Steam別ドライブ
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

# 5. 手動入力
if (-not $targetDir) {
    Write-Host "ゲームのインストール先を自動検出できませんでした。" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "『One-armed robber』のインストールフォルダ（OAR.exe があるフォルダ）のパスを入力してください。"
    Write-Host "（フォルダをこの画面にドラッグ＆ドロップしても入力できます）"
    $inputPath = Read-Host "フォルダパス"
    $inputPath = $inputPath.Trim('"').Trim("'")
    if (Test-Path -LiteralPath (Join-Path $inputPath "OAR.exe")) {
        $targetDir = $inputPath
    } else {
        Write-Host "[エラー] 指定されたフォルダに OAR.exe が見つかりませんでした。" -ForegroundColor Red
        Show-Msg "指定されたフォルダに OAR.exe が見つかりませんでした。`nパスを確認して再度お試しください。" "エラー" 16
        Write-Host ""
        Write-Host "Enterキーを押して終了してください..."
        Read-Host
        exit 1
    }
}

Write-Host "インストール先: $targetDir" -ForegroundColor Green
Write-Host ""

$paksDir = Join-Path $targetDir "OAR\Content\Paks"
$backupDir = Join-Path $paksDir "backup"

if (-not (Test-Path -LiteralPath $paksDir)) {
    New-Item -ItemType Directory -Force -Path $paksDir | Out-Null
}
if (-not (Test-Path -LiteralPath $backupDir)) {
    New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
}

$destPak = Join-Path $paksDir "OAR-WindowsNoEditor_Japanese_P.pak"

# 既存パッチがある場合は backup に退避
if (Test-Path -LiteralPath $destPak) {
    Write-Host "既存のパッチファイルを backup フォルダに退避しています..." -ForegroundColor Gray
    $backupDest = Join-Path $backupDir "OAR-WindowsNoEditor_Japanese_P.pak"
    Move-Item -LiteralPath $destPak -Destination $backupDest -Force | Out-Null
}

Write-Host "日本語化パッチファイルを配置しています..." -ForegroundColor Cyan
Copy-Item -LiteralPath $patchPak -Destination $destPak -Force

if (Test-Path -LiteralPath $destPak) {
    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host "  日本語化パッチのインストールが完了しました！" -ForegroundColor Green
    Write-Host "  ゲームを起動して日本語表示をお楽しみください。" -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host ""
    Show-Msg "日本語化パッチの適用が正常に完了しました！`n`nゲームを起動して日本語表示をお楽しみください。" "One-armed robber 日本語化パッチ" 64
} else {
    Write-Host "[エラー] コピーに失敗しました。管理者権限で実行してください。" -ForegroundColor Red
    Show-Msg "パッチファイルのコピーに失敗しました。`n管理者権限で実行するか、セキュリティソフトの設定をご確認ください。" "エラー" 16
}

Write-Host "Enterキーを押してウィンドウを閉じてください..."
Read-Host