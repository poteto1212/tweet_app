class User < ApplicationRecord
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password,{presence: true}


    #ユーザー別投稿機能を作成する為のモデルメソッド

    def posts
        return Post.where(user_id: self.id)
    end
end
