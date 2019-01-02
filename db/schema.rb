# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_01_111648) do

  create_table "ffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "FFS各因子詳細", force: :cascade do |t|
    t.string "label", comment: "記号"
    t.string "name", comment: "名前"
    t.string "description", comment: "詳細"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ffs_type_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "91Type 説明", force: :cascade do |t|
    t.string "4_type", comment: "4タイプ分類, Ex: TG, AN等"
    t.string "91_type", comment: "91タイプ分類, Ex: ACB, BC, D等"
    t.string "description", comment: "タイプでの説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "a", comment: "凝縮性"
    t.integer "b", comment: "受容性"
    t.integer "c", comment: "弁別性"
    t.integer "d", comment: "拡散性"
    t.integer "e", comment: "保全性"
    t.string "4_type", comment: "4タイプ分類, Ex: TG, AN等"
    t.string "91_type", comment: "91タイプ分類, Ex: ACB, BC, D等"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", comment: "社員番号等のキー値"
    t.string "name", comment: "名前"
    t.string "name_en", comment: "英語名"
    t.string "email", comment: "メールアドレス"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
