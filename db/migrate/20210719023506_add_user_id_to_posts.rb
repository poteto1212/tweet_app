class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    #カラム追加命令を記載する(追加対象のテーブル名,カラム名,データ型)
    add_column :posts,:user_id,:integer
  end
end
