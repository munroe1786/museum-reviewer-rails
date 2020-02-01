Specs:

 [X] Using Ruby on Rails for the project
        
        Rails 6.0.1 is in use
 
 [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
        
        User has_many Reviews and has_many Museums
 
 [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        
        Reviews belong_to Users and Museums
 
 [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

        Museum has_many users, through: :reviews
        User has_many reviewed_museums, through: :reviews, source: :museum

 
 [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

        Museum has_many users, through: :reviews
        User has_many reviewed_museums, through: :reviews, source: :museum
 
 [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

        Reviews have user submitted date_visited, content and rating
 
 [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

        User has email validation
        Museum has name and location validations
        Review has date_visited and content validations, as well as a rating validation for 1-10 only
 
 [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

        Review model has a scope method to order the reviews based on rating, from high to low, with a limit of 5
 
 [X] Include signup (how e.g. Devise)

        Devise
 
 [X] Include login (how e.g. Devise)

        Devise
 
 [X] Include logout (how e.g. Devise)

        Devise
 
 [X] Include third party signup/login (how e.g. Devise/OmniAuth)

        Omniauth with Github login setup
 
 [X] Include nested resource show or index (URL e.g. users/2/recipes)

        Review show route is nested in Museum show view
 
 [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

        Review new route is nested in Museum show view
 
 [X] Include form display of validation errors (form URL e.g. /recipes/new)
    
        Museum and Review forms render errors partial form to handle display of validation errors.

Confirm:

 [X] The application is pretty DRY

        Partials are user to keep view DRY

 [X] Limited logic in controllers

        Most logic is in models and views.

 [X] Views use helper methods if appropriate

        Error helper in use.

 [X] Views use partials if appropriate

        Partials for forms and errors in use.  