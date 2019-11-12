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
- ユーザー登録

  [トップページ](http://3.114.187.95/)に入りましたら、右上にある[ユーザー登録]から登録を行います。
  Eメールは架空の物で構いません。
  Nicknameは、記事の投稿者名として表示されます。
  パスワードは6文字以上でお願いします。

  ![ユーザー登録](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/sign_in_2.gif)

- 記事の投稿

  ユーザー登録後は、記事の投稿が出来るようになります。
  スポット名、スポットの紹介・エピソード、スポットの所在地、写真、評価はそれぞれ必須入力項目となっています。（未入力のまま[投稿する]を押すと、エラー画面が表示されます）
  投稿が成功した場合、フラッシュメッセージが表示され、トップページにリダイレクトします。

  ![記事の投稿](https://raw.githubusercontent.com/wiki/YuichiMotomura/portfolio/images/contribution_2.gif)

- 記事の詳細ページ
- 記事の編集
- 記事の削除


### Tables & Association
- ER図
- テーブル(Column, Type, Options)

