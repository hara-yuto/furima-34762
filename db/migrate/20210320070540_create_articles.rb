class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer    :category_id     , null: false
      t.integer    :condition_id    , null: false
      t.integer    :payer_id        , null: false
      t.integer    :area_id         , null: false
      t.integer    :delivery_day_id , null: false
      t.timestamps
    end
  end
end
