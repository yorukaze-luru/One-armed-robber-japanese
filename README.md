# One-armed robber 非公式日本語化パッチ (Unofficial Japanese Patch)

[![Unreal Engine 4.27](https://img.shields.io/badge/Engine-Unreal%20Engine%204.27-blue.svg)](https://www.unrealengine.com/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20(Steam)-green.svg)](https://store.steampowered.com/app/2551020/Onearmed_robber/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Release](https://img.shields.io/badge/Release-v1.1.2-brightgreen.svg)](RELEASE_NOTES.md)

Steamにて無料配信中の片腕強盗FPS**『One-armed robber』**を日本語化する非公式パッチです。  
ゲーム内のUI、メニュー、設定項目、HUD、ダイアログ、チュートリアル案内、ミッション目標指示など、プレイに必要なテキストを自然な日本語にローカライズします。

---

## 🌟 特徴

- **📂 手動でファイルを入れるだけで簡単導入**  
  解凍した `OAR` フォルダをゲームフォルダに入れるだけで、100%確実に日本語化が適用されます。余計なバッチやスクリプトは一切含みません。
- **🎓 チュートリアル＆全ミッション目標も完全日本語化**  
  マップ内の案内テキスト（ドリルの使い方、配電盤のショート、ダッフルバッグの詰め方等）や、画面上部のミッション目標指示もすべて日本語化されています。
- **🎮 タイトルロゴは英語を維持**  
  メインメニューのタイトルロゴは英語（ONE-ARMED ROBBER）のまま表示され、スタイリッシュな雰囲気を保ちます。
- **📐 フォントサイズの最適化調整済み**  
  日本語全角文字の視認性に合わせ、各UIのフォントサイズをバランスよくスケーリング調整。枠やボタンからはみ出さず、美しく読みやすいレイアウトを実現しました。
- **🛡️ UI直接パッチング方式（Direct Asset Patching）による完全動作**  
  UE4のカルチャ設定に依存せず、起動直後からすべてのUIが確実に日本語で表示されます。

---

## 📦 ダウンロード

以下のリリースページから最新の ZIP ファイルをダウンロードしてください：

- **[GitHub Releases (最新版)](https://github.com/yorukaze-luru/One-armed-robber-japanese/releases/latest)**
- 直接ダウンロード: **[One-armed_robber_Japanese_Patch.zip](https://github.com/yorukaze-luru/One-armed-robber-japanese/releases/download/v1.1.2/One-armed_robber_Japanese_Patch.zip)**

---

## 🛠️ インストール手順（手動導入）

ファイルをコピーするだけで簡単に導入できます。

1. ダウンロードした `One-armed_robber_Japanese_Patch.zip` を解凍します。
2. 解凍したフォルダ内にある **`OAR`** フォルダを、ゲームのインストールフォルダ（`OAR.exe` がある場所）にそのままドラッグ＆ドロップ（上書きコピー）してください。
3. 通常通りSteamからゲームを起動すれば、日本語化が完了しています！

> [!TIP]
> **Steam版の一般的なインストール先フォルダ：**  
> `C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\`  
> （Steamライブラリでゲームを右クリック ➔「管理」➔「ローカルファイルを閲覧」で一発で開けます）

---

## 🗑️ アンインストール手順（元の英語に戻す場合）

ゲームフォルダ内の以下のファイルを削除するだけで、いつでも元の英語に戻せます：  
`OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak`

---

## 📋 主な日本語化対応範囲

| カテゴリ | 主な対応箇所 |
| :--- | :--- |
| **メインメニュー・ロビー** | プレイ、ゲーム開始、公開/非公開ロビー、ロビー検索、装備、ショップ、スキル、セットアップ、クレート、ゲーム終了 など |
| **設定画面** | 操作設定、キー割り当て、視点感度、エイム感度、グラフィックス、最大FPS、視野角 (FOV)、モーションブラー、解像度スケール、各種音量、ボイスチャット方式 など |
| **ゲーム内HUD・通知** | 獲得金額表示、立入禁止区域警告、市民の通報アラート、配電盤破壊目標、デバイスハッキング、ピッキング操作説明、クリアタイム、強盗成功/失敗リザルト など |
| **チュートリアル＆目標指示** | ステルス／ラウドチュートリアルマップ内案内、全マップのミッション目標指示（Instructions）、ダッフルバッグ・配電盤ポップアップ など |
| **ショップ・外見・装備** | ハイストコインショップ、武器・ツールカテゴリ、スキン、チャーム、クレート解錠、装備プレビュー など |

---

## ❓ よくある質問 (FAQ)

<details>
<summary><b>Q. ゲームのアップデートがあった場合はどうなりますか？</b></summary>
パッチは独立したPakファイルとして動作するため、小規模なアップデートであればそのまま適用され続けます。大規模なUI変更等があった場合は、本リポジトリにて更新版を公開予定です。
</details>

<details>
<summary><b>Q. オンラインマルチプレイ（Co-op）でも使えますか？</b></summary>
はい。UIの表示テキストおよびフォントのみを変更するクライアントサイドModのため、オンラインマルチプレイでも問題なく動作します。
</details>
