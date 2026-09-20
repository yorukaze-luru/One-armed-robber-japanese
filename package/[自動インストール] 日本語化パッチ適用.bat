@echo off
setlocal enabledelayedexpansion
title One-armed robber 日本語化パッチ インストーラー

echo ========================================================
echo   One-armed robber 日本語化パッチ 自動インストーラー
echo ========================================================
echo.

set PATCH_PAK=%~dp0OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak

if not exist "!PATCH_PAK!" (
    echo [エラー] パッチ本体が見つかりません。
    echo 解凍したフォルダの構成を変更せずに実行してください。
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('パッチ本体（OAR-WindowsNoEditor_Japanese_P.pak）が見つかりません。`n解凍したフォルダの構成を変更せずに実行してください。', 'エラー', 0, 16)"
    pause
    exit /b 1
)

:: 1. 同じフォルダにゲーム本体があるか確認
if exist "%~dp0OAR.exe" (
    set TARGET_DIR=%~dp0
    goto :INSTALL
)

:: 2. デスクトップ上のフォルダを確認
if exist "%USERPROFILE%\Desktop\One-armed robber\OAR.exe" (
    set TARGET_DIR=%USERPROFILE%\Desktop\One-armed robber\
    goto :INSTALL
)

:: 3. Steamの標準インストール先を確認
if exist "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\OAR.exe" (
    set TARGET_DIR=C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\
    goto :INSTALL
)

:: 4. Steamの別ドライブ (Dドライブ等) を確認
for %%D in (D E F G) do (
    if exist "%%D:\SteamLibrary\steamapps\common\One-armed robber\OAR.exe" (
        set TARGET_DIR=%%D:\SteamLibrary\steamapps\common\One-armed robber\
        goto :INSTALL
    )
)

:: 5. 見つからない場合は入力を促す
echo ゲームのインストール先を自動検出できませんでした。
echo.
echo 『One-armed robber』のインストールフォルダ（OAR.exe があるフォルダ）のパスを入力してください。
echo （フォルダをこのウィンドウにドラッグ＆ドロップしても入力できます）
echo.
set /p TARGET_DIR="フォルダパス: "
set TARGET_DIR=!TARGET_DIR:"=!

if not exist "!TARGET_DIR!\OAR.exe" (
    echo.
    echo [エラー] 指定されたフォルダに OAR.exe が見つかりませんでした。
    echo パスを確認して再度お試しください。
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('指定されたフォルダに OAR.exe が見つかりませんでした。`nパスを確認して再度お試しください。', 'エラー', 0, 16)"
    pause
    exit /b 1
)

:INSTALL
echo.
echo インストール先: "!TARGET_DIR!"
echo.

set PAKS_DIR=!TARGET_DIR!\OAR\Content\Paks
set BACKUP_DIR=!PAKS_DIR!\backup

if not exist "!PAKS_DIR!" (
    mkdir "!PAKS_DIR!" > nul 2>&1
)

:: バックアップフォルダを作成
if not exist "!BACKUP_DIR!" (
    mkdir "!BACKUP_DIR!" > nul 2>&1
)

:: 既存のパッチファイルがある場合はバックアップフォルダに退避
if exist "!PAKS_DIR!\OAR-WindowsNoEditor_Japanese_P.pak" (
    echo 既存のパッチファイルを backup フォルダに退避しています...
    move /Y "!PAKS_DIR!\OAR-WindowsNoEditor_Japanese_P.pak" "!BACKUP_DIR!\" > nul 2>&1
)

echo 日本語化パッチファイルを配置しています...
copy /Y "!PATCH_PAK!" "!PAKS_DIR!\OAR-WindowsNoEditor_Japanese_P.pak" > nul

if exist "!PAKS_DIR!\OAR-WindowsNoEditor_Japanese_P.pak" (
    echo.
    echo ========================================================
    echo   日本語化パッチのインストールが完了しました！
    echo   ゲームを起動して日本語表示をお楽しみください。
    echo ========================================================
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('日本語化パッチの適用が正常に完了しました！`n`nゲームを起動して日本語表示をお楽しみください。', 'One-armed robber 日本語化パッチ', 0, 64)"
) else (
    echo.
    echo [エラー] コピーに失敗しました。管理者権限で実行してください。
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('パッチファイルのコピーに失敗しました。`n管理者権限で実行するか、セキュリティソフトの設定をご確認ください。', 'エラー', 0, 16)"
)

pause