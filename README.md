# 変数名の付け方に注意したこと
・何の値を扱ってる変数か直感的にわかるよう命名  
・変数名が長い場合はスネークケースを使用  
・配列・ハッシュを取り扱う変数は複数形で命名  

# クラスに持たせた責任範囲の考え方
・VendingMachineの責任を大分類すると"お金"と"ドリンク"の2つと考えました。  
ですが、起こりうるトラブルを考えると  
ex1) お釣りが返ってこない  
ex2)  売上が計上されない  
ex3 ドリンクが出てこない(差引されない)  
といったことが考えられますが  
ドリンクの責務としては、  
①VendingMachineがインスタンス化された際の初期化時にドリンクが入っていること  
②ドリンクが購入された際に在庫が1個減ること  
くらいの責務であり、数字の移動が激しい"お金"と比べ責任が軽いと判断しました。  
つまり、ドリンクの責任はほぼないと見なしてクラス1つで良いだろうという結論に達した次第です。  

# こだわりの実装ポイント
・VendingMachineのインスタンスが初期値で持っているドリンクをmoduleに切り出して見やすく、編集しやすくしたこと  
・ドリンクのデータ構造をネストしたハッシュ構造にし、取り扱いしやすい形にしたこと  
・インスタンス化後にドリンクを補充できるようにrestockメソッドを作成したこと  

# SGさんに聞いてみたい事・リファクタしてもらいたい箇所など
・責務の考え方について、正しく考えられているか教えていただきたい  
・クラス1つで実装した点について、この考え方はありか教えていただきたい  
・モジュールの使い方としてありか教えていただきたい  
・冗長になってる部分を指摘いただきたい  