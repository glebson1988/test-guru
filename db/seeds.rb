# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = User.create!([
                         {first_name: 'admin',
                          last_name: 'administrator',
                          email:'glebson1988@yandex.ru',
                          password: 'qwerty',
                          password_confirmation: 'qwerty',
                          type: 'Admin'}
                     ])

categories = Category.create!([
                                  {title: 'Frontend'},
                                  {title: 'Backend'},
                                  {title: 'Mobile'}
                              ])

tests = Test.create!([
                         {title: 'Ruby', level: 2, category: categories[1], author: users[0]},
                         {title: 'HTML', level: 1, category: categories[0], author: users[0]},
                         {title: 'Python', level: 3, category: categories[1], author: users[0]},
                         {title: 'Swift', level: 3, category: categories[2], author: users[0]},
                         {title: 'JS', level: 2, category: categories[0], author: users[0]}
                     ])

questions = Question.create!([
                                 {body: 'Who is Matz?', test: tests[0]},
                                 {body: 'What is HTML?', test: tests[1]},
                                 {body: 'Who is Gvido?', test: tests[2]},
                                 {body: 'Swift is language for Android or for iOS?', test: tests[3]},
                                 {body: 'What is Callback hell?', test: tests[4]}
                             ])

answers = Answer.create!([
                             {body: 'He is Ruby creator', correct: true, question: questions[0]},
                             {body: 'He is Python creator', correct: false, question: questions[0]},
                             {body: 'He is JS creator', correct: false, question: questions[0]},
                             {body: 'He is PHP creator', correct: false, question: questions[0]},
                             {body: 'HyperText Markup Language', correct: true, question: questions[1]},
                             {body: 'Hype Turbo Multi Language', correct: false, question: questions[1]},
                             {body: 'He is Python creator', correct: true, question: questions[2]},
                             {body: 'He is PHP creator', correct: false, question: questions[2]},
                             {body: 'For iOS', correct: true, question: questions[3]},
                             {body: 'For Android', correct: false, question: questions[3]},
                             {body: 'Second alias is noodles in JS', correct: true, question: questions[4]},
                             {body: 'I dont know', correct: false, question: questions[4]}
                         ])

