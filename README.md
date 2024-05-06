
# Menu Management Backend Application
## Technical assessment for Popmenu

Built with Rails 7.

To install:
1. clone this repo
2. in a terminal, navigate to the root 'Menu-Management' directory
3. run:
```bash
bundle install
rails db:create
rails db:migrate
rails server
```
To run the test suite, run:

`rspec spec -fd`

### Level 1

- Started off by setting up my Rails server using the scaffolding tool. Assuming I'm not concerned about selective user access (prevent creating/updating/deleting based on credentials)

- Creating an 'api' namespace with versioning for access to menu and menu items; created directories reflecting this within controller, where I'm moving controllers for menu and menuItems.

- Adding some basic data into the database using the rails command line. Getting familiar with API URLs, how they're formatted

- For this level, I've set up menu items so that they're associated with specific menus; assuming this is intended so that level 2 requires a schema update?

- Installed rspec-rails; learning how to use it...

- Created rspec models for data models; learning how to require certain attributes on creation (such as menu name, menuItem name, price, etc.)...

- Created tests for Menu and Menu Items. 

### Apologies all - didn't give myself enough time to complete this more thoroughly. 

### Enjoyed both the project and learning some Rails! 

### Cheers, 

### Chris Antley