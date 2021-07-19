#モデルにはバリデーションや外部キーなどデータベース設定に関与する命令
class Post < ApplicationRecord
    #バリデーション :カラム名,{設定}
    validates :content,{
        presence: true,#空白禁止
        length:{maximum: 140}#最大140文字
    }

    #user_idカラムにバリデーションを追加する
    validates :user_id,{presence: true}


    #モデルにインスタンスメソッドを定義するとコントローラで扱う事が出来る
    #コントローラORMでモデルクエリを使う=モデルクラスのインスタンス生成(Djangoでも行ける！)
    def user
        return User.find_by(id: self.user_id)
    end
end
