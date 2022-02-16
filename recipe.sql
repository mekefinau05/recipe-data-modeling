CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_email VARCHAR(100) NOT NULL,
  user_password VARCHAR(500) NOT NULL,
  user_bio VARCHAR(1000),
  account_created TIMESTAMP NOT NULL,
  user_recipe_count INT,
  user_recipe_status BOOLEAN
);

CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  recipe_name VARCHAR(100) NOT NULL,
  recipe_img TEXT,
  recipe_instructions VARCHAR(2000) NOT NULL,
  recipe_ingredients_id INT NOT NULL REFERENCES ingredients(ingredient_id),
  chef_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE friends (
  follow_id SERIAL PRIMARY KEY,
  follower_id INT NOT NULL REFERENCES users(user_id),
  following_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(50) NOT NULL,
  ingredient_picture TEXT NOT NULL
);

CREATE TABLE create_lists (
  list_id SERIAL PRIMARY KEY,
  list_recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  list_ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id)
);

CREATE TABLE occasions (
  occasion_id SERIAL PRIMARY KEY,
  occasion_owner_id INT NOT NULL REFERENCES users(user_id),
  occasion_recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);
