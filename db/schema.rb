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

ActiveRecord::Schema.define(version: 2019_07_20_194729) do

  create_table "ffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "FFS各因子詳細", force: :cascade do |t|
    t.string "label", comment: "記号"
    t.string "name", comment: "名前"
    t.string "overview", comment: "詳細"
    t.string "long_description", comment: "91タイプ分類が1因子だけの場合の長めの説明"
    t.string "short_description", comment: "91タイプ分類が2因子以上の場合の短めの説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_ffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "member_id"
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

  create_table "member_stresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "member_id"
    t.integer "point", comment: "ストレス値"
    t.date "diagnostic_at", comment: "診断日"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", comment: "社員番号等のキー値"
    t.string "name", comment: "名前"
    t.string "name_en", comment: "英語名"
    t.string "email", comment: "メールアドレス"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_team_members_on_member_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "チーム名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

end
