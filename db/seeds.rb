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
                state: 'ゴムのようにのびる',
                postage_burden: 2, 
                shipping_date: '3日',
                shipping_origin_area: '東京',
                category_id: 1,
                seller_id: 2,
                },
                {
                name: 'ナミのぬいぐるみ',
                comment: '', 
                price: 5656, 
                state: 'ココヤシ村出身',
                postage_burden: 2, 
                shipping_date: '3日',
                shipping_origin_area: '富山',
                category_id: 1,
                seller_id: 2,
                }
              ]
            )

User.create!(
              [
                {
                email:"ruffy@a"
                nickname:"rufy"
                first_name:"る"
                first_name


                }
              ]




            )