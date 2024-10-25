import 'package:flutter/material.dart';
import '/main.dart';
import '/card.dart';
import 'RecipeDetailPage.dart';
import 'FavoritePage.dart';

class ExploreRecipesPage extends StatefulWidget {
  @override
  ExploreRecipesPageState createState() => ExploreRecipesPageState();
}

class ExploreRecipesPageState extends State<ExploreRecipesPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore Recipes',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
          _buildDietToggle(),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to the Favorites page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavoriteRecipesPage(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
      ),
      body: backgroundContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, 
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8, 
                                      ),
                        itemCount: _filteredRecipes.length,
                        itemBuilder: (context, index) {
                        final recipe = _filteredRecipes[index];
                        return GestureDetector(
                           onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                             builder: (context) => RecipeDetailPage(
                              recipe: recipe,
                              isFavorite: isFavorite(recipe),
                              onFavoriteToggle: () => toggleFavorite(recipe)
                              
                              
                              ),
                                    ),
                                  );
                                },
                                child: RecipeCard(
                                  recipe: recipe,
                                  isFavorite: isFavorite(recipe),
                                  onFavoriteToggle: () => toggleFavorite(recipe),
                            ),
                          );
                        },
                      ),
                    ),
            ),
    );
  }

  Widget _buildDietToggle() {
    return PopupMenuButton(
      icon: Icon(Icons.filter_list),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: dietFilters.keys.map((dietOption) {
                return CheckboxListTile(
                  title: Text(dietOption),
                  value: dietFilters[dietOption],
                  onChanged: (bool? value) {
                    setState(() {
                      dietFilters[dietOption] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ];
      },
    );
  }

   // Toggle favorite status
  void toggleFavorite(Map<String, dynamic> recipe) {
    setState(() {
      if (isFavorite(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  }



 Map<String, bool> dietFilters = {
    'vegetarian': false,
    'non-vegetarian': false,
    'gluten-free': false,
    'nut-free':false
  };


  

   // Check if a recipe is in favorites
  bool isFavorite(Map<String, dynamic> recipe) {
    return favoriteRecipes.contains(recipe);
  }

  

 List<Map<String, dynamic>> get _filteredRecipes {
      // If no filter is selected, return all recipes
    if (dietFilters.values.every((selected) => !selected)) {
      return recipes;
    }

    // Return recipes that match any of the selected diets
    return recipes.where((recipe) {
      // Check if the recipe has any of the selected diet options
      return dietFilters.entries.any((filter) =>
          filter.value == true && recipe['diet'].contains(filter.key));
    }).toList();
  }

 final List<Map<String, dynamic>> recipes = [
    {
      "image": "assets/aspaghetti.png",
      "title": "Spaghetti Bolognese",
      "ingredients": ["1 tbsp Olive Oil", "1 Onion, Diced", "2 Carrots, Diced", "2 Celery Stalks, Diced", "2 to 3 Cloves Garlic", "5 Leaves Fresh Basil (or 2 tsp Dried Basil)","14 oz Canned Diced Tomatoes", "17 oz Crushed Tomatoes", "1 c Water", "2 tsp Dried Oregano", "1 lb Ground Beef, Extra Lean", "Salt and Pepper to Taste", "1 lb Spaghetti", "Freshly Grated Parmesean Cheese"],
      "instructions": "1. In a large and deep frying pan or a Dutch Oven heat 1 tbsp of olive oil, then add diced onions, carrots, celery, minced garlic and cook on low heat for 10 minutes without colouring the vegetables. \n2. Then add ground beef and brown it until the beef is no longer pink inside while stirring the whole time and making sure to break up the beef. Pour in both types of canned tomatoes and water with a pinch of salt and pepper.\n3. Sprinkle in some dried oregano and torn basil leaves (reserve a few small ones), bring everything to a boil. Then turn the heat down and let it simmer with a lid ajar for for 2.5-3 hours stirring it once in a while.\n4. When your Bolognese is nearly done, boil a large pot of water and cook spaghetti according to package directions. \n5. Drain your spaghetti and add your pasta to the sauce, stir gently and take off the heat. Top with reserved basil leaves. Serve with freshly grated Parmesan cheese.",
      "diet": ["nut-free"]
    },
    {
      "image": "assets/agrilledchicken.png",
      "title": "Grilled Chicken Breast",
      "ingredients": ["1.75 lbs Boneless, Skinless Chicken Breast", "3 tbsp Olive Oil", "1.25 tsp Kosher Salt", "2 to 4 Cloves Garlic", "1/2 tsp Ground Black Pepper", "3 tbsp Lemon Juice","Chopped Fresh Herbs", "Crumbled Feta Cheese"],
      "instructions": "1. Place the chicken breasts on a cutting board (leave several inches between them and work in batches as needed). Cover with plastic wrap to keep things tidy, and with a meat mallet, rolling pin, or your fist, pound the chicken to an even thickness. It doesn't need to be ultra thin—just make sure the middle is fairly even with the ends (the chicken should be about 1/2-inch thick).\n2. With a fork, poke holes all over the chicken (this will allow the marinade to absorb).\n3. In a large ziptop bag, combine the Olive oil, Kosher Salt, Garlic Cloves, Black Pepper, and Lemon Juice, then add the Chicken.\n4. Seal the bag to evenly coat the chicken with the marinade. Place in a pan or bowl to catch any drips. Let the chicken marinate at room temperature for at least 30 minutes, or refrigerate it to marinate for up to 12 hours (5 to 6 hours is ideal). \n5. When ready to grill, preheat the grill to high (475 degrees F). If your chicken has been in the refrigerator, remove it and allow it to come to room temperature for at least 10 minutes.\n6. Place the chicken on the grill presentation (smooth) side down, shaking off any excess marinade. Cover the grill and let cook for 4 to 5 minutes on the first side, then flip. The chicken should lift easily off the grill; if it sticks, allow it to cook another minute or two.\n7. Recover the grill and cook for an additional 4 to 8 minutes. Chicken is considered done at 165 degrees F. I like to remove chicken from the grill around the 155-160 degree F mark and allow it to finish cooking while resting. DO NOT OVERCOOK, or your chicken will be dry.\n8. Place the chicken on a plate and let rest for at least 5 minutes (resting is mandatory!). Add any desired toppings or sauces.",
      "diet": ["nut-free"]
    },
    {
      "image": "assets/appleoats.png",
      "title": "Apple Pie Overnight Oats",
      "ingredients": ["1 Medium Apple, Chopped", "2 tsp Ground Cinnamon", "1.5 tbsp Maple Syrup", "Sea Salt", "1.5 c Almond Milk", "2 tsp Chia Seeds", "1 tsp Vanilla Extract", "1/8 tsp Ground Nutmeg", "1 c Old-Fashioned Oats", "2 tbsp chopped walnuts"],
      "instructions": "1. Add the apples, cinnamon, maple syrup and a pinch of sea salt to small sauce pan over low heat. \n2. Mix to combine then cover and cook for about 10 minutes, stirring occasionally, until the apples are tender. \n3. Remove the lid, increase the heat to medium and cook an additional 2-3 minutes or until the sauce thickens slightly and coats the apples and excess liquid evaporates.\n4. Remove from the heat and set aside while you make the oats.\n5. In a small bowl, add the milk, chia seeds, vanilla, cinnamon, nutmeg, and maple syrup.\n6. Add the oats and mix to combine.\n7. Add 1/4 of the oat mixture to 2 mason jars (8oz) or airtight containers (with lids).\n8. Layer each evenly with ¼ of the apples then top each with an equal amount of the remaining oats and 1 tablespoon walnuts.\n9. Cover and refrigerate overnight.\n10. Oats may be eaten cold, at room temperature or warm.",
      "diet": ["vegan", "vegetarian", "gluten-free"]
    },
    {
      "image": "assets/acreamysoup.png",
      "title": "Creamy Chicken and Mushroom Soup",
      "ingredients": ["4 c Water", "3 tbsp Gluten-Free Flour", "1 Celery Stalk, Halved", "5 oz Shiitake Mushrooms, Sliced", "8 oz Crimini Mushrooms, Sliced", "4 tsp Gluten-Free Chicken Bouillon", "2 tsp Unsalted Butter", "7 oz Boneless Skinless Chicken Breast", "1 tbsp Fresh Parsley, Chopped"],
      "instructions": "1. Place cold water and flour in a blender and blend until smooth; pour into a medium pot and set heat to medium.\n2. Add celery, mushrooms, chicken bouillon and butter and bring to a boil.\n3. Add chicken, cover and simmer on low 15 minutes, or until chicken is cooked through.\n4. Remove chicken and set aside; continue to cook the remaining soup an additional 5 minutes, until vegetables are soft. \n5. Place celery and 1 cup of soup into the blender; blend until smooth, then return to the pot and simmer a few minutes.\n6. Shred or cut the chicken into small pieces and add back to the soup, garnish with fresh parsley.",
      "diet": ["gluten-free", "nut-free"]
    },
    {
      "image": "assets/asweetpotato.png",
      "title": "Sweet Potato Salad",
      "ingredients": ["2 medium sweet potatoes, peeled and chopped into 1/2-inch cubes (about 2 cups, 20 ounces total)", "4 tbsp Extra Virgin Olive Oil", "1 tsp Sweet Paprika", "1 tsp Garlic Powder", "1/2 tsp Kosher Salt", "Black Pepper, to Taste", "1/4 c Red Onion, Diced", "4 c Baby Arugula", "4 oz Hass Avocado, Cubed", "1.5 tbsp Apple Cider Vinegar", "1 tsp Agave", "1 tsp Cumin"],
      "instructions": "1. Preheat the oven to 400F.\n2. Place the sweet potato cubes on a baking sheet. Drizzle with the olive oil and toss. In a small bowl, stir together the paprika, garlic powder, 1/2 teaspoon salt and black pepper.\n3. Sprinkle the spice mixture over the potatoes and toss to combine. Bake 13-15 minutes, toss then bake for additional 13-15 minutes, or until tender.\n4. While the sweet potato is cooking, mix the salad dressing together in a large bowl and add the onions.\n5. Remove the roasted sweet potatoes from the oven and while still hot, toss them into the large bowl with the salad dressing, then let them cool at least 5 minutes.\n6. Once cool, add the arugula, 1 teaspoon olive oil and 1/8 teaspoon salt and toss well.\n7. Divide 4 bowls, adjust salt and pepper to taste then top with 1 ounce avocado in each bowl.",
      "diet": ["nut-free", "vegetarian", "gluten-free"]
    },
    // Add more recipes as needed
  ];

  