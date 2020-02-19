# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: 'admin', company_name: 'Johnny Inc.')
user2 = User.create(first_name: 'Sergey', last_name: 'Dmitriev', email: 'sergey.dmitrievb@gmail.com', password: 'Charles', company_name: 'Warner')
user3 = User.create(first_name: 'Liza', last_name: 'Galminas', email: 'liza.galmias@gmail.com', password: 'Liza-galminas001', company_name: 'Mateyka')
user4 = User.create(first_name: 'Adam', last_name: 'Graham', email: 'adamg@gmail.com', password: 'graymatters', company_name: 'Gray Matters')
user5 = User.create(first_name: 'Matthew', last_name: 'Clark', email: 'matthew.97.clark@gmail.com', password: 'Pwnfish2010', company_name: 'State of Mind')
user6 = User.create(first_name: 'John', last_name: 'Fineman', email: 'jhonfineman@mattr.com', password: 'joshmattr', company_name: 'Mattr Media')

client1 = Client.create(user: user1)
client2 = Client.create(user: user2)
client3 = Client.create(user: user3)

pm1 = ProjectManager.create(user: user4)
pm2 = ProjectManager.create(user: user5)
pm3 = ProjectManager.create(user: user6)


project1 = Project.create(name: 'New website', project_manager: pm1, client: client1, status: 'delivered', max_revisions: 5)
project2 = Project.create(name: 'New mobile application', project_manager: pm2, client: client2, status: 'in progress', max_revisions: 10)
project3 = Project.create(name: 'rebranding', project_manager: pm3, client: client3, status: 'in progress', max_revisions: 15)
project4 = Project.create(name: 'test api projects', project_manager: pm2, client: client3, status: 'in progress', max_revisions: 15)

revision1 = Revision.create(project: project1, description: 'Re-design the homepage', status: 'completed')
revision2 = Revision.create(project: project1, description: 'Change contact details', status: 'in progress')
revision3 = Revision.create(project: project2, description: 'Make the fonts different everywhere', status: 'completed')
revision4 = Revision.create(project: project2, description: 'Add newsletted signup functionality', status: 'in progress')
revision5 = Revision.create(project: project3, description: 'redesign the logo fully', status: 'in progress')
revision6 = Revision.create(project: project3, description: 'change the color palette', status: 'in progress')
revision7 = Revision.create(project: project4, description: 'test1', status: 'in progress')
revision8 = Revision.create(project: project4, description: 'test2', status: 'in progress')

comment1 = Comment.create(revision: revision1, user: user1, content: 'Change the structure')
comment3 = Comment.create(revision: revision2, user: user2, content: 'Here are the details we need changing')
comment4 = Comment.create(revision: revision3, user: user3, content: 'we were thingking more this font...')
comment5 = Comment.create(revision: revision4, user: user4, content: 'we use mailchimp as our newsletter service')
comment6 = Comment.create(revision: revision5, user: user5, content: 'this logo is completely wrong...')
comment7 = Comment.create(revision: revision6, user: user6, content: 'need some more bright colors in the mix')


