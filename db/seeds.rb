# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = User.create!([
                         {name: 'Gleb'},
                         {name: 'Ivan'}
                     ])

categories = Category.create!([
                                  {title: 'Frontend'},
                                  {title: 'Backend'},
                                  {title: 'Mobile'}
                              ])

tests = Test.create!([
                         {title: 'Ruby', level: 2, category_id: categories[1].id},
                         {title: 'HTML', level: 1, category_id: categories[0].id},
                         {title: 'Python', level: 3, category_id: categories[1].id},
                         {title: 'Swift', level: 3, category_id: categories[2].id},
                         {title: 'JS', level: 2, category_id: categories[0].id}
                     ])

questions = Question.create!([
                                 {body: 'Who is Matz?', test_id: tests[0].id},
                                 {body: 'What is HTML?', test_id: tests[1].id},
                                 {body: 'Who is Gvido?', test_id: tests[2].id},
                                 {body: 'Swift is language for Android or for iOS?', test_id: tests[3].id},
                                 {body: 'What is Callback hell?', test_id: tests[4].id}
                             ])

answers = Answer.create!([
                             {body: 'He is Ruby creator', correct: true, question_id: questions[0].id},
                             {body: 'He is Python creator', correct: false, question_id: questions[0].id},
                             {body: 'He is JS creator', correct: false, question_id: questions[0].id},
                             {body: 'HyperText Markup Language', correct: true, question_id: questions[1].id},
                             {body: 'Hype Turbo Multi Language', correct: false, question_id: questions[1].id},
                             {body: 'He is Python creator', correct: true, question_id: questions[2].id},
                             {body: 'He is PHP creator', correct: false, question_id: questions[2].id},
                             {body: 'For iOS', correct: true, question_id: questions[3].id},
                             {body: 'For Android', correct: false, question_id: questions[3].id},
                             {body: 'Second alias is noodles in JS', correct: true, question_id: questions[4].id},
                             {body: 'I dont know', correct: false, question_id: questions[4].id}
                         ])

passed_tests = PassedTest.create!([
                                      {user_id: users[0].id, test_id: tests[0].id, score: 10},
                                      {user_id: users[0].id, test_id: tests[1].id, score: 8},
                                      {user_id: users[0].id, test_id: tests[2].id, score: 4},
                                      {user_id: users[1].id, test_id: tests[0].id, score: 10},
                                      {user_id: users[1].id, test_id: tests[1].id, score: 6},
                                      {user_id: users[0].id, test_id: tests[3].id, score: 8},
                                      {user_id: users[0].id, test_id: tests[4].id, score: 8},
                                      {user_id: users[1].id, test_id: tests[3].id, score: 6}
                                  ])
