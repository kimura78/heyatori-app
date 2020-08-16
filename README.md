## アプリケーションの概要

部屋取りアプリは、オンライン上で作成した部屋をグループ内のユーザーが予約できるアプリです。
Rails API + Vue.js(Vuetify)で構成されています。


## URL
https://www.heyatori-app.tk/#/

![スクリーンショット 2020-07-27 18 21 09](https://user-images.githubusercontent.com/53544498/88542657-b83aa180-d051-11ea-8001-e11941873777.png)

## 使い方

* 画面上の「かんたんログイン」を押すとゲストユーザーとしてログインできます。
* グループを作成し、グループ詳細画面のURLを共有することでグループへの招待が行えます。
* ホーム画面から日付を選択し、部屋・タイムテーブルを作成することで投票ができるようになります。

## 開発環境

* Dockerで構築

* AWSにデプロイ(EC2, RDS, S3, ACM, IAM)

* DB : Postgresql

* web・APサーバ（Nginx, Puma）

* circleCi

## 実装した機能一覧

* ユーザー作成・編集機能(deviseを使用)

* ユーザーログイン・ログアウト機能

* かんたんログイン機能

* Vuetifyを用いたレスポンシブデザイン

* 部屋・タイムテーブル・投票のCRUD機能

* i18nによる日本語化
