admin = User.create({name: 'admin', email: 'admin@gmail.com', password: 'asd123!',
  password_confirmation: "asd123!", })
admin.admin!
admin.skip_confirmation!
admin.save

equip1 = Equipment.create({name: "エアコン"})
equip2 = Equipment.create({name: "テレビ"})
equip3 = Equipment.create({name: "ジム"})
equip4 = Equipment.create({name: "温泉"})

room1 = Room.create({room_type: "シングル", bed_numbers: 1, guest_no: 1})
room2 = Room.create({room_type: "ダブル", bed_numbers: 1, guest_no: 2})
room3 = Room.create({room_type: "ツイン", bed_numbers: 2, guest_no: 2})
room4 = Room.create({room_type: "トリプル", bed_numbers: 2, guest_no: 3})
Motel.create!(name: "asdsad", level: 3, description: "dm ttt", address: "tran duy hung", phone: "2455445452")
Review.create!(title: "test",content: "test content", user_id: 1, motel_id: 1)