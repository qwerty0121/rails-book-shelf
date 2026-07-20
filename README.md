# rails-book-shelf

## 概要

- Ruby / Rails の実装スキルを身につけるための学習用リポジトリ。
- 題材として「蔵書管理アプリ」を採用し、CRUDの基本から認証・非同期処理・テストまで、段階的に学習要素を積み増していく方針で開発する。
- 外部APIとの連携は行わず、Rails自体の機能習得に集中する。

## 学習方針

- 実用性より「Railsの機能を一通り触れるかどうか」を優先する
- 最初は最小構成のCRUDから始め、フェーズを追うごとに機能を追加していく
- 各フェーズの実装内容・学びは本READMEおよびコミットログに残す

## 開発ロードマップ

### Phase 1: 基本のCRUD

- [x] `Book` モデル（タイトル、著者名、読了状態、メモ）
- [x] RESTfulルーティング / コントローラ7アクション
- [ ] バリデーション
- [ ] Flashメッセージ

### Phase 2: モデル分割とアソシエーション

- [ ] `Author` モデル分離（`belongs_to` / `has_many`）
- [ ] `Series` モデル分離（1対多）
- [ ] タグ機能（多対多, `has_many :through`）
- [ ] ネストしたリソース
- [ ] N+1問題の検知と `includes` 対応

### Phase 3: 検索・並び替え・ページネーション

- [ ] タイトル・著者・タグでの絞り込み（scope）
- [ ] 並び替え機能
- [ ] ページネーション（kaminari / pagy）
- [ ] 検索用フォームオブジェクト

### Phase 4: 認証・認可

- [ ] Devise によるユーザー登録・ログイン
- [ ] ユーザーと本の紐付け（「自分の本棚」化）
- [ ] Pundit / CanCanCan による認可制御

### Phase 5: ファイル・非同期処理

- [ ] Active Storage による表紙画像アップロード
- [ ] image_processing gem による画像リサイズ
- [ ] CSVインポート/エクスポート
- [ ] Active Job による非同期処理

### Phase 6: テスト

- [ ] RSpec（モデルスペック / リクエストスペック）
- [ ] Capybara によるシステムテスト
- [ ] FactoryBot

### Phase 7: API化

- [ ] JSON APIモード（JBuilder）
- [ ] シリアライゼーション設計

### Phase 8以降: 発展

- [ ] 評価・レビュー機能（ポリモーフィック関連）
- [ ] Action Mailer / Action Cable による通知
- [ ] 管理画面（ActiveAdmin / Avo）
- [ ] i18n対応
- [ ] パフォーマンスチューニング（インデックス設計、Bullet導入）

## 環境

- Ruby: 3.4.10
- Rails: ~> 8.1.3
- DB: PostgreSQL

## セットアップ

devcontainer起動時（`postCreateCommand`）に `bundle install` と `rails db:prepare` が自動実行されるため、追加のセットアップは不要です。

```bash
bin/rails server -b 0.0.0.0
```

## 学習メモ

各フェーズで得た気づきや詰まったポイントは `docs/notes/` 以下、
またはこのセクションに追記していく。
