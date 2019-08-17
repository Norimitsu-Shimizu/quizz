<a href="https://img.shields.io/github/languages/code-size/Norimitsu-Shimizu/quizz"><img src="https://img.shields.io/github/languages/code-size/Norimitsu-Shimizu/quizz"></a>
<a href="https://img.shields.io/github/languages/top/Norimitsu-Shimizu/quizz"><img src="https://img.shields.io/github/languages/top/Norimitsu-Shimizu/quizz"></a>

# Quizz

<img width="1363" alt="スクリーンショット 2019-08-15 12 23 42" src="https://user-images.githubusercontent.com/50897909/63076071-d4dbe780-bf6e-11e9-852d-e6440a53d1c6.png">


https://grownquiz.herokuapp.com/

クイズに答えて自分の知識のレベルを上げよう!
自分でクイズを作ることもできるよ!

## Purpose
クイズを解くことで学習する楽しみを体験して、学習意欲を高めていきます。



## 使い方
1.ユーザー登録を行います。(ユーザー登録をしなくてもクイズに挑戦することはできます。)


2.ユーザー登録を行った後、問題作成やマイページに入ることができます。


3.問題形式は3択形式になっています。


4.問題作成ページでは問題を作成することができます。



## 問題作成のやり方

<img width="1347" alt="スクリーンショット 2019-08-17 22 14 49" src="https://user-images.githubusercontent.com/50897909/63212256-7f553580-c13c-11e9-80ed-8a924ac2c6d2.png">



1.問題作成ページは問題フォームと答えのフォームが3つ、答えに対応する正解フォーム、ジャンル選択があります。


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
|experience|integer|-|
|level_id|references|foreign_key: true|

### Association
- has_many :questions
- belogs_to :level

- - - 

## questionsテーブル
|Column|Type|Option|
|------|----|------|
|title|text|null: false|
|user_id|references|foreign_key: true|
|genre_id|references| foreign_key: true|

### Association
- belongs_to :user
- belongs_to :genre
- has_many :answers

- - - 

## answersテーブル
|Column|Type|Option|
|------|----|------|
|answer|text|null: false|
|correct|string|-|
|question_id|references|foreign_key: true|

### Association
- belongs_to :question

- - - 

## genresテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Associaton
- has_many :questions

- - - 

## levelsテーブル
|Column|Type|Option|
|------|----|------|
|level|integer|null: false|
|count|integer|null: false|

### Association
- has_many :users
