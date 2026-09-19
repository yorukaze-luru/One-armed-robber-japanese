@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

echo ========================================================
echo   One-armed robber 日本語化パッチ 自動インストーラー
echo ========================================================
echo.

set PATCH_PAK=%~dp0OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak

if not exist "!PATCH_PAK!" (
    echo [エラー] パッチ本体が見つかりません。
    echo 解凍したフォルダの構成を変更せずに実行してください。
    echo.
    pause
    exit /b 1
)

:: 1. 同じフォルダにゲーム本体があるか確認
if exist "%~dp0OAR.exe" (
    set TARGET_DIR=%~dp0
    goto :INSTALL
)

:: 2. ユーザーのデスクトップ上のフォルダを確認
if exist "%USERPROFILE%\Desktop\One-armed robber\OAR.exe" (
    set TARGET_DIR=%USERPROFILE%\Desktop\One-armed robber\
    goto :INSTALL
)

:: 3. Steamの標準インストール先を確認
if exist "C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\OAR.exe" (
    set TARGET_DIR=C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\
    goto :INSTALL
)

:: 4. 見つからない場合は入力を促す
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
    pause
    exit /b 1
)

:INSTALL
echo.
echo インストール先: "!TARGET_DIR!"
echo パッチファイルをコピーしています...

if not exist "!TARGET_DIR!\OAR\Content\Paks" (
    mkdir "!TARGET_DIR!\OAR\Content\Paks" > nul 2>&1
)

copy /Y "!PATCH_PAK!" "!TARGET_DIR!\OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak" > nul

if exist "!TARGET_DIR!\OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak" (
    echo.
    echo ========================================================
    echo   日本語化パッチのインストールが完了しました！
    echo   ゲームを起動して日本語表示をお楽しみください。
    echo ========================================================
) else (
    echo.
    echo [エラー] コピーに失敗しました。管理者権限で実行してください。
)

echo.
pause
