# One-armed robber 非公式日本語化パッチ (Unofficial Japanese Patch)

[![Unreal Engine 4.27](https://img.shields.io/badge/Engine-Unreal%20Engine%204.27-blue.svg)](https://www.unrealengine.com/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20(Steam)-green.svg)](https://store.steampowered.com/app/2551020/Onearmed_robber/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Release](https://img.shields.io/badge/Release-v1.1.1-brightgreen.svg)](RELEASE_NOTES.md)

Steamにて無料配信中の片腕強盗FPS**『One-armed robber』**を日本語化する非公式パッチです。  
ゲーム内のUI、各種メニュー、設定項目、HUD、ダイアログ、チュートリアルなど、プレイに必要な210箇所以上のテキストを自然な日本語にローカライズします。

---

## 🌟 特徴

- **📂 手動でファイルを入れるだけで簡単導入**  
  パッチファイル（`OAR-WindowsNoEditor_Japanese_P.pak`）または `OAR` フォルダをゲームフォルダに入れるだけで、100%確実に日本語化が適用されます。
- **🎮 フォントサイズの最適化調整済み**  
  日本語全角文字の視認性に合わせ、各UIのフォントサイズをバランスよくスケーリング調整。枠やボタンからはみ出さず、美しく読みやすいレイアウトを実現しました。
- **🛡️ UI直接パッチング方式（Direct Asset Patching）による完全動作**  
  UE4のカルチャ設定に依存せず、起動直後からすべてのUIが確実に日本語で表示されます。
- **⚙️ ゲーム本来のオリジナル設定メニューを忠実に維持**  
  余計なカスタム項目は入れず、オリジナル通りの設定画面のまま日本語化されています。

---

## 📦 ダウンロード

以下のリリースページから最新の ZIP ファイルをダウンロードしてください：

- **[GitHub Releases (最新版)](https://github.com/yorukaze-luru/One-armed-robber-japanese/releases/latest)**
- 直接ダウンロード: **[One-armed_robber_Japanese_Patch.zip](https://github.com/yorukaze-luru/One-armed-robber-japanese/releases/download/v1.1.1/One-armed_robber_Japanese_Patch.zip)**

---

## 🛠️ インストール手順（手動導入）

ファイルをコピーするだけで簡単に導入できます。

### 方法1：OARフォルダをドラッグ＆ドロップ（超かんたん）

1. ダウンロードした `One-armed_robber_Japanese_Patch.zip` を解凍します。
2. 解凍したフォルダ内にある **`OAR`** フォルダを、ゲームのインストールフォルダ（`OAR.exe` がある場所）にそのままドラッグ＆ドロップ（上書きコピー）してください。
3. 通常通りゲームを起動すれば、日本語化が完了しています！

> [!TIP]
> **Steam版の一般的なインストール先フォルダ：**  
> `C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\`  
> （Steamライブラリでゲームを右クリック ➔「管理」➔「ローカルファイルを閲覧」で一発で開けます）

### 方法2：Pakファイルを直接入れる場合

ゲームフォルダ内の `OAR\Content\Paks\` フォルダに、解凍フォルダ内の `【直接配置用】OAR-WindowsNoEditor_Japanese_P.pak` をコピーするだけでも完了します。

※ワンクリックで導入したい方向けに、`[自動インストール] 日本語化パッチ適用.bat` も同梱しています。

---

## 🗑️ アンインストール手順（元の英語に戻す場合）

ゲームフォルダ内の `OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak` を削除するだけで、いつでも元の英語に戻せます。

> [!TIP]
> **Steam版の一般的なインストール先フォルダ：**  
> `C:\Program Files (x86)\Steam\steamapps\common\One-armed robber\`  
> （Steamライブラリでゲームを右クリック ➔「管理」➔「ローカルファイルを閲覧」で一発で開けます）

---

## 🗑️ アンインストール手順（英語に戻す場合）

- **自動で戻す場合：**  
  解凍フォルダ内の **`[自動アンインストール] パッチ削除.bat`** を実行してください。
- **手動で戻す場合：**  
  ゲームフォルダ内の `OAR\Content\Paks\OAR-WindowsNoEditor_Japanese_P.pak` を削除するだけで、即座に元の英語に戻ります。

---

## 📋 主な日本語化対応範囲

| カテゴリ | 主な対応箇所 |
| :--- | :--- |
| **メインメニュー・ロビー** | プレイ、ゲーム開始、公開/非公開ロビー、ロビー検索、装備、ショップ、スキル、セットアップ、クレート、ゲーム終了 など |
| **設定画面** | 操作設定、キー割り当て、視点感度、エイム感度、グラフィックス、最大FPS、視野角 (FOV)、モーションブラー、解像度スケール、各種音量、ボイスチャット方式 など |
| **ゲーム内HUD・通知** | 獲得金額表示、立入禁止区域警告、市民の通報アラート、配電盤破壊目標、デバイスハッキング、ピッキング操作説明、クリアタイム、強盗成功/失敗リザルト など |
| **ショップ・外見・装備** | ハイストコインショップ、武器・ツールカテゴリ、スキン、チャーム、クレート解錠、装備プレビュー など |
| **ミッション・その他** | ステルスチュートリアル、ラウドチュートリアル、下準備（セットアップ）ミッション、各種警告ダイアログ など |

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

<details>
<summary><b>Q. Steamの「ファイルの整合性を確認」を実行するとどうなりますか？</b></summary>
元のゲームファイルは改変していないため、整合性チェックに引っかかりません。もしパッチファイルが削除された場合は、再度パッチ適用バッチを実行してください。
</details>

---

## 📄 ライセンス & クレジット

- **フォントライセンス:**  
  本パッチに同梱されているフォントは、株式会社モリサワが提供する [BIZ UDゴシック](https://github.com/googlefonts/morisawa-biz-ud-gothic)（SIL Open Font License 1.1）を使用しています。
- **ゲーム著作権:**  
  『One-armed robber』の著作権および関連するすべての権利は、開発元の **Duhndal** に帰属します。
- **パッチライセンス:**  
  本パッチのスクリプトおよび構成ファイルは [MIT License](LICENSE) の下で公開されています。

---

## ⚠️ 免責事項

本パッチはファンによる非公式のローカライズ作品であり、ゲーム開発元（Duhndal）とは一切関係ありません。本パッチの使用によって生じた損害やトラブル等について、製作者は一切の責任を負いかねますのでご了承ください。
