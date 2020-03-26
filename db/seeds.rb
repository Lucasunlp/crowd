# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Director.create(first_name: 'Steven', last_name: 'Spielberg', aliases: 'steve.spielberg')
Director.create(first_name: 'Woody', last_name: 'Allen', aliases: 'woody.allen')

Producer.create(first_name: 'Kevin', last_name: 'Boateng', aliases: 'kevin.boateng')
Producer.create(first_name: 'Ralph', last_name: 'Nein', aliases: 'ralph.nein')

Movie.create(title: 'first_movie', release_year: '2020-03-01', director_id: 1, producer_id: 1)
Movie.create(title: 'second_movie', release_year: '2020-03-01', director_id: 2, producer_id: 2)


Actor.create(first_name: 'Leonardo', last_name: 'Di Caprio', aliases: 'leonardo.dicaprio')
Actor.create(first_name: 'Jeremy', last_name: 'Di Santo', aliases: 'j.disanto')

Actress.create(first_name: 'Angelina', last_name: 'Jolie', aliases: 'angelina.jolie')
Actress.create(first_name: 'Ana', last_name: 'Camber', aliases: 'ana.c')


MovieWorker.create(actress_id: 1, actor_id: 1, movie_id: 1)
MovieWorker.create(actress_id: 2, actor_id: 2, movie_id: 2)
