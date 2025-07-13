# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このリポジトリは iOS アプリケーション「CaludeCodeApp」の SwiftUI プロジェクトです。標準的な iOS アプリの構造を持つ新規プロジェクトで、メインアプリ、ユニットテスト、UIテストの3つのターゲットから構成されています。

## アーキテクチャ

### アプリ構造
- **CaludeCodeApp**: メインアプリケーションターゲット
  - `CaludeCodeAppApp.swift`: アプリのエントリーポイント（@main）
  - `Assets.xcassets/`: アプリアイコンとアセット

### テスト構造
- **CaludeCodeAppTests**: ユニットテストターゲット
  - Swift Testing フレームワークを使用（`@Test` アノテーション）
  - `@testable import CaludeCodeApp` でメインモジュールをインポート

- **CaludeCodeAppUITests**: UIテストターゲット  
  - XCTest フレームワークを使用
  - アプリケーションの起動とパフォーマンステストが含まれる

## 開発コマンド

### ビルド
```bash
# デバッグビルド
xcodebuild -scheme CaludeCodeApp -configuration Debug build

# リリースビルド  
xcodebuild -scheme CaludeCodeApp -configuration Release build

# iOS シミュレータ向けビルド
xcodebuild -scheme CaludeCodeApp -sdk iphonesimulator build
```

### テスト実行
```bash
# 全テスト実行
xcodebuild test -scheme CaludeCodeApp -destination 'platform=iOS Simulator,name=iPhone 15'

# ユニットテストのみ
xcodebuild test -scheme CaludeCodeApp -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:CaludeCodeAppTests

# UIテストのみ
xcodebuild test -scheme CaludeCodeApp -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:CaludeCodeAppUITests
```

### クリーンとアーカイブ
```bash
# クリーンビルド
xcodebuild clean -scheme CaludeCodeApp

# アーカイブ作成
xcodebuild archive -scheme CaludeCodeApp -archivePath ./CaludeCodeApp.xcarchive
```

## 技術スタック

| 項目                    | バージョン／要件                                           |
| --------------------- | -------------------------------------------------- |
| iOS Deployment Target | 16.0 以上                                            |
| Swift Toolchain       | Swift 6 (swift-6.0-DEVELOPMENT-SNAPSHOT または正式版)    |
| Package Manager       | Swift Package Manager（SPM）                         |
| 主要フレームワーク             | SwiftUI・Combine・Observation (`import Observation`) |

## プロジェクト仕様
- **言語**: Swift 6（strict concurrency & access modifier rules 有効）
- **ターゲット OS**: iOS 16 以上
- **UI フレームワーク**: 100% SwiftUI
- **アーキテクチャ**: MVVM（View / ViewModel / Model をディレクトリ分割）
- **状態管理**: Observation フレームワークの `@Observation` マクロを使用し、Combine は最小限に
- **依存ライブラリ**: 追加ライブラリ無し（標準フレームワークのみ）

## プロジェクト設定

- **Product Name**: CaludeCodeApp
- **Bundle Identifier**: （プロジェクト設定で確認）
- **Deployment Target**: iOS 16.0+
- **Build Configurations**: Debug, Release

## 実装ポリシー
- Non‑isolated sync functions は可読性を優先して最小限に
- ビジネスロジックは ViewModel に集約し、View からは `@Bindable` を通じて直接操作しない
- 戻り値の無い関数は `-> Void` を明示

### 成果物
1. `CaludeCodeApp/` 以下に `CaludeCodeAppApp.swift`（`@main` エントリ）、`ContentView.swift`
1. `login/`と`top/` に機能 (Model · ViewModel · View) を実装
1. `login`はログイン機能でロゴ（任意のsvg）、タイトル、テキストフィールド（idとpassword）、ハイパーリンクのラベル、ログインボタンのパーツがあり、ログインボタン押下で`top`トップ機能の画面へ遷移する。
1. `top`はトップ機能でロゴ（任意のsvg）、説明文のラベル（改行あり）、`picker view`、ボタンのパーツがありボタンを押下するとapiを呼び出す。
1. `top`で呼び出すapiについては実際にapiを呼ばず、仮のコードでよく、２つのapiを連続で呼び出し、apiを呼び出し終えたらokボタンのみの`alert view`を表示する。
1. ログイン機能とトップ機能の画面は ![画面イメージ](./AppImage/image01.png "画面イメージ")
1. テストは作成しなくてよい。


## 3. ディレクトリ構成サンプル

```
.
├── ios-claude-code-app/
│   └── README.md
├── ios-claude-code-app/CaludeCodeApp/CaludeCodeApp/
│   ├── Assets.xcassets
│   ├── CaludeCodeAppApp.swift
│   ├── login
│         ├── LoginView.swift
│         └── LoginViewModel.swift
│   ├── top
│         ├── TopView.swift
│         ├── TopModel.swift
│         └── TopViewModel.swift
│   └── Preview Content
```
