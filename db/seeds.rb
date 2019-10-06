# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Item.create!(
              [
                {name: 'ルフィのぬいぐるみ',
                comment: 'フーシャ村出身', 
                price: 5656, 
                state_id: 1,
                postage_burden_id: 2, 
                shipping_date_id: 1,
                prefecture_id: 5,
                category_id: 1,
                seller_id: 2,
                },
                {
                name: 'ナミのぬいぐるみ',
                comment: 'ココヤシ村出身', 
                price: 7373, 
                state_id: 1,
                postage_burden_id: 2, 
                shipping_date_id: 1,
                prefecture_id: 5,
                category_id: 1,
                seller_id: 2,
                }
              ]
            )

Category.create!([{name: '--'},
                  {name: 'レディース'},
                  {name: 'メンズ'},
                  {name: 'ベビー・キッズ'},
                  {name: 'インテリア・住まい・小物'},
                  {name: '本・音楽・ゲーム'},
                  {name: 'おもちゃ・ホビー・グッズ'},
                  {name: 'コスメ・香水・美容'},
                  {name: '家電・スマホ・カメラ'},
                  {name: 'スポーツ・レジャー'},
                  {name: 'ハンドメイド'},
                  {name: 'チケット'},
                  {name: '自動車・オートバイ'},
                  {name: 'その他'}
                 ]
                )
