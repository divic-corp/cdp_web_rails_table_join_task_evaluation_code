# ActiveRecordテーブル結合課題 評価コード

## 概要

本リポジトリは、WEF／WEPのActiveRecordテーブル結合課題に使用するRSpec評価コードを管理するものです。受講生が実装するRailsアプリケーション本体は含みません。

実際の採点では、本リポジトリを評価対象アプリケーションの`spec/`ディレクトリとして配置し、受講生が実装したモデル、コントローラ、データベーススキーマおよびテストデータに対してRSpecを実行します。

## 対応環境

- Ruby 4.0.5
- Ruby on Rails 8.1.3
- Bundler 4.0.10
- RSpec 3.13
- RSpec Rails 8.0
- PostgreSQL（実際の採点環境）
- SQLite（本リポジトリ単体の互換性確認に限定して使用）

依存関係には、FactoryBot、Faker、Capybara、Database Cleaner、`rails-controller-testing`およびShoulda Matchersを含みます。なお、Capybara、FakerおよびDatabase Cleanerは課題アプリケーションとの依存関係の整合性を確認するために固定しており、現行の評価テストから直接は使用していません。

## 評価目的

モデルspecでは、課題で指定された`belongs_to`、`has_many`、polymorphic associationおよび`through` associationを検証します。

コントローラspecでは、以下を検証します。

1. `exercise1`が`Food.left_outer_joins`を使用し、注文されていないすべての料理を`ActiveRecord::Relation`として`@foods`へ代入すること
2. `exercise2`が`Shop.left_outer_joins`を使用し、注文されていない料理を提供するすべての店舗を`ActiveRecord::Relation`として`@shops`へ代入すること
3. `exercise3`が`Address.joins`を使用し、注文数が最も多い住所と、その注文数を`orders_count`として取得すること
4. `exercise4`が`Customer.joins`を使用し、料理代金の合計が最も高い顧客と、その合計額を`foods_price_sum`として取得すること

必須JOINメソッドの未使用、取得結果の相違、ArrayまたはClassの返却、集計値またはaliasの相違、associationの相違は、従来どおり不合格となります。Rails 8.1対応を理由とした期待値の緩和は行っていません。

## 本リポジトリ単体での互換性確認

Ruby 4.0.5を使用し、以下を実行してください。

```sh
bundle install
bundle exec rspec
bundle exec rake evaluation:verify
```

`evaluation/compatibility_app`は、Ruby 4.0.5／Rails 8.1.3上で評価コードをロードし、明らかな未実装を適切に不合格と判定できることを確認するための、分離された検証用アプリケーションです。コントローラは課題の初期状態と同等の未実装状態であり、正答となるクエリや部分的な正答実装は含みません。

互換性確認では、以下を検証します。

- 全30件のテストがロード・実行され、未実装のコントローラに関する6件だけが不合格となること
- モデルspec 24件が、各ファイルの単体実行でも正常に動作すること
- コントローラspecの単体実行が6件すべてを不合格と判定すること
- 9件のFactoryBot定義を正常に読み込めること
- 評価結果formatterが6件の不合格を正しく出力すること
- 評価コード側のload errorを、想定された不合格として誤認しないこと

この検証用アプリケーションはインメモリSQLiteを使用し、親ディレクトリに実際のRailsアプリケーションが存在する採点環境では読み込まれません。

## 実際の採点環境での実行

本リポジトリを課題アプリケーションの`spec/`ディレクトリとして配置したうえで、以下を実行します。

```sh
RAILS_ENV=test bundle exec rails db:prepare
bundle exec rspec
```

採点ワークフローでは、必要に応じて`RAILS_ENV`および`DATABASE_URL`を設定します。本リポジトリ単体の互換性確認では、外部サービスや環境変数の設定は不要です。

## 正答情報の取り扱い

本リポジトリは受講生から参照可能であることを前提とし、現行ファイルにはコントローラ課題の正答クエリを保存しません。正答クエリを使用した合格確認は、受講生から参照できない検証環境で実施してください。

なお、Gitの過去履歴に正答実装が含まれている場合、現行ファイルから削除するだけでは閲覧を防止できません。正答情報の秘匿が必要な場合は、リポジトリの非公開化、評価コードの配布経路の見直し、または組織管理者による履歴削除を別途実施してください。
