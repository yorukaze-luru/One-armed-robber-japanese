@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

echo ========================================================
echo   One-armed robber 日本語化パッチ アンインストーラー
echo ========================================================
echo.

set TARGET_DIR=

:: 1. 同じフォルダにゲーム本体があるか確認
if exist "%~dp0OAR.exe" (
    set TARGET_DIR=%~dp0
    goto :UNINSTALL
)

:: 2. ユーザーのデスクトップ上のフォルダを確認
if exist "%USERPROFILE%\Desktop\One-armed robber\OAR.exe" (
    set TARGET_DIR=%USERPROFILE%\Desktop\One-armed robber\
    goto :UNINSTALL
)

:: 3. Steamの標準インストール先を確認
if exist "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\OAR.exe" (
    set TARGET_DIR=C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\
    goto :UNINSTALL
)

:: 4. 見つからない場合は入力を促す
echo ゲームのインストール先を自動検出できませんでした。
echo.
echo 『One-armed robber』のインストールフォルダ（OAR.exe があるフォルダ）のパスを入力してください。
echo.
set /p TARGET_DIR="フォルダパス: "
set TARGET_DIR=!TARGET_DIR:"=!

:UNINSTALL
set PAK_PATH=!TARGET_DIR!\OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak

if exist "!PAK_PATH!" (
    del /F /Q "!PAK_PATH!"
    echo.
    echo ========================================================
    echo   日本語化パッチを削除し、元の英語状態に戻しました。
    echo ========================================================
) else (
    echo.
    echo 日本語化パッチは見つかりませんでした。（既に削除されているか、未導入です）
)

echo.
pause
