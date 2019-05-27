# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create([
                {name: 'Gleb'},
                {name: 'Ivan'}
            ])

Category.create([
                    {title: 'Frontend'},
                    {title: 'Backend'},
                    {title: 'Mobile'}
                ])

Test.create([
                {title: 'Ruby', level: 2, category_id: 2},
                {title: 'HTML', level: 1, category_id: 1},
                {title: 'Python', level: 3, category_id: 2},
                {title: 'Swift', level: 3, category_id: 3},
                {title: 'JS', level: 2, category_id: 1}
            ])

Question.create([
                    {body: 'Who is Matz?', test_id: 1},
                    {body: 'What is HTML?', test_id: 2},
                    {body: 'Who is Gvido?', test_id: 3},
                    {body: 'Swift is language for Android or for iOS?', test_id: 4},
                    {body: 'What is Callback hell?', test_id: 5}
                ])

Answer.create([
                  {body: 'He is Ruby creator', correct: true, question_id: 1},
                  {body: 'He is Python creator', correct: false, question_id: 1},
                  {body: 'He is JS creator', correct: false, question_id: 1},
                  {body: 'HyperText Markup Language', correct: true, question_id: 2},
                  {body: 'Hype Turbo Multi Language', correct: false, question_id: 2},
                  {body: 'He is Python creator', correct: true, question_id: 3},
                  {body: 'He is PHP creator', correct: false, question_id: 3},
                  {body: 'For iOS', correct: true, question_id: 4},
                  {body: 'For Android', correct: false, question_id: 4},
                  {body: 'Second alias is noodles in JS', correct: true, question_id: 5},
                  {body: 'I dont know', correct: false, question_id: 5}
              ])

PassedTest.create([
                      {user_id: 1, test_id: 1, score: 10},
                      {user_id: 1, test_id: 2, score: 8},
                      {user_id: 1, test_id: 3, score: 4},
                      {user_id: 2, test_id: 1, score: 10},
                      {user_id: 2, test_id: 2, score: 6},
                      {user_id: 1, test_id: 4, score: 8},
                      {user_id: 1, test_id: 5, score: 8},
                      {user_id: 2, test_id: 4, score: 6}
                  ])
