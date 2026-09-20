@echo off
setlocal enabledelayedexpansion
title One-armed robber 日本語化パッチ アンインストーラー

echo ========================================================
echo   One-armed robber 日本語化パッチ アンインストーラー
echo ========================================================
echo.

:: 1. 同じフォルダにゲーム本体があるか確認
if exist "%~dp0OAR.exe" (
    set TARGET_DIR=%~dp0
    goto :UNINSTALL
)

:: 2. デスクトップ上のフォルダを確認
if exist "%USERPROFILE%\Desktop\One-armed robber\OAR.exe" (
    set TARGET_DIR=%USERPROFILE%\Desktop\One-armed robber\
    goto :UNINSTALL
)

:: 3. Steamの標準インストール先を確認
if exist "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\OAR.exe" (
    set TARGET_DIR=C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\
    goto :UNINSTALL
)

:: 4. Steamの別ドライブを確認
for %%D in (D E F G) do (
    if exist "%%D:\SteamLibrary\steamapps\common\One-armed robber\OAR.exe" (
        set TARGET_DIR=%%D:\SteamLibrary\steamapps\common\One-armed robber\
        goto :UNINSTALL
    )
)

:: 5. 見つからない場合は入力を促す
echo ゲームのインストール先を自動検出できませんでした。
echo 『One-armed robber』のインストールフォルダ（OAR.exe があるフォルダ）のパスを入力してください。
echo.
set /p TARGET_DIR="フォルダパス: "
set TARGET_DIR=!TARGET_DIR:"=!

if not exist "!TARGET_DIR!\OAR.exe" (
    echo [エラー] 指定されたフォルダに OAR.exe が見つかりませんでした。
    pause
    exit /b 1
)

:UNINSTALL
set PAK_FILE=!TARGET_DIR!\OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak

if exist "!PAK_FILE!" (
    del /f /q "!PAK_FILE!" > nul 2>&1
    echo.
    echo ========================================================
    echo   日本語化パッチを削除しました。
    echo   ゲームは元の状態に戻りました。
    echo ========================================================
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('日本語化パッチの削除が完了しました。`n`nゲームは元の英語状態に戻りました。', 'One-armed robber 日本語化パッチ', 0, 64)"
) else (
    echo [案内] 日本語化パッチファイルは見つかりませんでした。（すでに削除されています）
    echo.
    powershell -WindowStyle Hidden -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('日本語化パッチファイルは見つかりませんでした。`nすでに元の状態に戻っています。', 'One-armed robber 日本語化パッチ', 0, 64)"
)

pause