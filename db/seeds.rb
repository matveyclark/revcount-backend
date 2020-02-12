# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client1 = Client.create(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com', password: 'admin')
client2 = Client.create(first_name: 'Sergey', last_name: 'Dmitriev', email: 'sergey.dmitrievb@gmail.com', password: 'Charles')
client3 = Client.create(first_name: 'Liza', last_name: 'Galminas', email: 'liza.galmias@gmail.com', password: 'Liza-galminas001')

pm1 = ProjectManager.create(first_name: 'Adam', last_name: 'Graham', email: 'adamg@gmail.com', password: 'graymatters', company_name: 'Gray Matters')
pm2 = ProjectManager.create(first_name: 'Matthew', last_name: 'Clark', email: 'matthew.97.clark@gmail.com', password: 'Pwnfish2010', company_name: 'State of Mind')
pm3 = ProjectManager.create(first_name: 'John', last_name: 'Fineman', email: 'jhonfineman@mattr.com', password: 'joshmattr', company_name: 'Mattr Media')

project1 = Project.create(name: 'New website', project_manager: pm1, client: client1, status: 'delivered', max_revisions: 5)
project2 = Project.create(name: 'New mobile application', project_manager: pm2, client: client2, status: 'in progress', max_revisions: 10)
project3 = Project.create(name: 'rebranding', project_manager: pm3, client: client3, status: 'in progress', max_revisions: 15)

revision1 = Revision.create(project: project1, description: 'Re-design the homepage', status: 'completed')
revision2 = Revision.create(project: project1, description: 'Change contact details', status: 'in progress')
revision3 = Revision.create(project: project2, description: 'Make the fonts different everywhere', status: 'completed')
revision4 = Revision.create(project: project2, description: 'Add newsletted signup functionality', status: 'in progress')
revision5 = Revision.create(project: project3, description: 'redesign the logo fully', status: 'in progress')
revision6 = Revision.create(project: project3, description: 'change the color palette', status: 'in progress')

comment1 = Comment.create(revision: revision1, content: 'Change the structure')
comment2 = Comment.create(revision: revision2, content: 'Here are the details we need changing')
comment3 = Comment.create(revision: revision3, content: 'we were thingking more this font...')
comment4 = Comment.create(revision: revision4, content: 'we use mailchimp as our newsletter service')
comment5 = Comment.create(revision: revision5, content: 'this logo is completely wrong...')
comment6 = Comment.create(revision: revision6, content: 'need some more bright colors in the mix')


