# Name: 街ログ！

### Overview
- 街歩きや散歩、通勤・通学等で見かけた、街の気になる風景を投稿、紹介出来るアプリです。

### Description
- このアプリを作るに当たって、CRUDの要素を含むアプリであることを念頭に置きました。
- また、下記のような機能を盛り込みました。
  - このアプリにアクセスしたユーザーは、誰でも記事を閲覧することが可能
  - ユーザー登録することで、記事の投稿が可能になる
  - 記事投稿の画面（新規スポットの作成）では、スポットの都道府県を選択すると、その市町村のセレクトボックスが表示される(ajaxの使用)
  - スポットの評価を投稿し、レーダーチャートとして表示する(JavaScript使用)
  - スポットの場所をGoogleMapで、表示する（GoogleMap API使用）

- 今後は下記の機能を追加していく予定です
  - いいね!機能
  - 記事へのコメント機能
  - 各都道府県ごとの特集ページ
  - ユーザーマイページ
  

### Version
- Ruby 2.5.1
- Rails 5.2.3

### Author
- [Yuichi Motomura](https://github.com/YuichiMotomura)

### Demo
- ユーザーログイン(テスト用アカウントにて)

  - [トップページ](http://3.114.187.95/)に入りましたら、右上にある[ログイン]からログインします。
    - Eメール：test@gmail.com
    - パスワード：111111

  ![ユーザーログイン](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/user_register1210.gif)

- 記事の投稿

  - ユーザー登録後は、記事の投稿が出来るようになります。
  - スポット名、スポットの紹介・エピソード、スポットの所在地、写真、評価はそれぞれ必須項目となっています。（未入力のまま[投稿する]を押すと、エラー画面が表示されます）
  - 投稿が成功した場合、フラッシュメッセージが表示され、トップページにリダイレクトします。

  ![記事の投稿](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/create1210.gif)

- 記事の詳細ページ

  - トップページに表示されている、記事の中から[詳しく読む]を押すと、詳細ページに移動します。
  - 詳細ページでは、評価のレーダーチャートとGoogle Mapにておおよその位置が表示されます。

  ![記事の詳細ページ](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/show1210.gif)

- 記事の編集

  - 該当記事の投稿者である場合、詳細ページに[編集する]のリンクが表示されますので、押すと、編集画面に移動します。
  - ここでは、画像を含む、全要素が変更可能です。
  [投稿する]ボタンを押すと、フラッシュメッセージが表示され、トップ画面にリダイレクトします。

  ![記事の編集](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/edit1210.gif)

- 記事の削除
  
  - 該当記事の投稿者である場合、詳細ページに[記事の削除]のリンクが表示されますので、押すと、確認メッセージが表示され、[OK]を押すと、フラッシュメッセージが表示され、トップ画面にリダイレクトします。

  ![記事の削除](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/delete.gif)


### ER diagram
- ER図

  - このアプリで使用されている、テーブルとアソシエーションを示すER図を下記に添付します。

  ![ER図](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/2019-11-12%2022.44.58.png)


