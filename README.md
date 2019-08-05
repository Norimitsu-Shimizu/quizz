# README

## quizz
クイズに答えて自分の知識のレベルを上げよう!
自分でクイズを作ることもできるよ!

## purpose
クイズを解くことで学習する楽しみを体験して、学習意欲を高めていきます。

## 使い方
1.ユーザー登録を行います。(ユーザー登録をしなくてもクイズに挑戦することはできます。)
2.ユーザー登録を行った後、問題作成やマイページに入ることができます。
3.問題形式は3択形式になっています。
4.問題作成ページでは問題を作成することができます

## 問題作成のやり方
1.問題作成ページは問題フォームと答えのフォームが3つ、答えに対応する正解フォーム、ジャンル選択があり
  ます。
2.問題フォームに問題を入力します。
3.答えのフォームが3つあるのでそれぞれ入力していきます。
4.問題に対する答えを答えフォームの右側にある正解フォームの中から一つ選択します。
5.答えフォームの下にあるジャンルフォームを問題に対応するジャンルを選択します。
6.1~5までを終えた後、作成するボタンを押すことで問題作成が完了します。

## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|

### Association
- has_many :questions

## questionsテーブル
|Column|Type|Option|
|------|----|------|
|title|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :genre
- has_many :answers

## answersテーブル
|Column|Type|Option|
|------|----|------|
|answer|text|null: false|
|correct|string|------|
|question_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :question

## genresテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Associaton
- has_many :questions

