User.create!(
  email: "caquita@gmail.com",
  first_name: "Admin",
  last_name: "Demo",
  admin: true
)


10.times do |i|
  User.create!(
    email: "usuario#{i + 1}@correo.com",
    first_name: "Un nombre#{i + 1}",
    last_name: "Un apellido#{i + 1}",
  )
end

10.times do |i|
  Chat.create!(
    sender_id: ((i + 1) % 10) + 1,
    receiver_id: ((i + 2) % 10) + 1
  )
end

10.times do |i|
  Message.create!(
    chat_id: (i % 10) + 1,
    user_id: ((i + 1) % 10) + 1,
    body: "Este es uno de los varios mensajes siendo este el numero #{i + 1}"
  )
end
