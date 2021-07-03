#モデルにはバリデーションや外部キーなどデータベース設定に関与する命令
class Post < ApplicationRecord
    #バリデーション :カラム名,{設定}
    validates :content,{
        presence: true,#空白禁止
        length:{maximum: 140}#最大140文字
    }
end
