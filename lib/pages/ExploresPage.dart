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

  bool isFavorite(Map<String, dynamic> recipe) {
    return favoriteRecipes.contains(recipe);
  }

 List<Map<String, dynamic>> get _filteredRecipes {
    if (dietFilters.values.every((selected) => !selected)) {
      return recipes;
    }

    return recipes.where((recipe) {
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
      "diet": ["nut-free", "vegetarian", "gluten-free", "vegan"]
    },
    {
      "image": "assets/apearsalad.png",
      "title": "Autumn Salad",
      "ingredients": ["2 tbsp Red Wine Vinegar", "1/2 Dijon Mustard", "1 tsp Honey", "1/4 Salt", "Ground Black Pepper to Taste", "3 tbsp Olive Oil", "2 Small Ripe Pears, Peeled and Diced", "2 oz Gorgonzola Cheese, Crumbled", "8 oz Mixed Baby Greens (Baby Spinach, Arugula, Radicchio, etc.)", "1 oz Pecan Halves"],
      "instructions": "1. In a small bowl, mix vinegar, mustard, honey, salt and pepper. Whisk in olive oil and blend.\n2. In a salad bowl combine baby greens, pears, gorgonzola cheese and pecans.\n3. When you are ready to serve, add the vinaigrette and toss well. Serve immediately.",
      "diet": ["vegetarian", "gluten-free", "vegan"]
    },
    {
      "image": "assets/awatermelongranita.png",
      "title": "Watermelon Cucumber Granita",
      "ingredients": ["4.5 c Seedless Watermelon, Peeled and Cubed", "1.5 c Cucumbers, Peeled, Seeded, and Chopped", "1/4 c Monk Fruit Sweetener", "1 tbsp Fresh Lime Juice", "Thin Cucumber Slices, for Garnish"],
      "instructions": "1. In a food processor or blender, puree the watermelon, cucumber, sugar, and lime juice until completely smooth. Pour the mixture into a 9 x 9-inch metal baking pan.\n2. Freeze for about 1 1/2 hours until it’s nearly set, then using a fork, give it a good scrape to mix everything around and break up any chunks. Return the pan to the freezer and freeze until almost set again, 1 to 2 hours.\n3. Use a fork to scrape the granita to form chunky snow-like ice crystals. Freeze and repeat occasional scraping until the entire mixture is frozen and shaved, about 5 hours total.\n4. To serve, divide the granita among serving glasses, and garnish with cucumber if desired.",
      "diet": ["vegetarian", "gluten-free", "vegan"]
    },
    {
      "image": "assets/ahoneyham.png",
      "title": "Honey Baked Spiral Ham",
      "ingredients": ["6 to 8 lbs Fully Cooked Spiral Bone-In Ham", "1/3 c Pineapple Juice", "Juice of 1/2 Orange", "2 tsp Dijon Mustard", "1/4 c Honey", "1 tbsp Brown Sugar"],
      "instructions": "1. Preheat oven to 275F.\n2. Place the spiral ham in a roasting pan, cut side down. Cover tightly with foil to prevent the ham from drying out.\n3. Bake ham in oven at 275F 12-15 minutes per pound, depending on the size of your ham. (Approximately 2 hours)\n4. In a small sauce pan combine brown sugar, honey, orange juice, pineapple juice and dijon. Whisk well and simmer on low 8 to 10 minutes, stirring often until it reduces down and thickens into a glaze.\n5. Remove the ham from oven 15 minutes before the ham is ready and brush the glaze onto the ham.\n6. Finish cooking the ham uncovered for the last 15 minutes.",
      "diet": ["gluten-free", "nut-free"]
    },
    {
      "image": "assets/asalmon.png",
      "title": "Slow Roasted Salmon",
      "ingredients": ["1 2-lb Whole Wild Salmon Filet, with Skin", "1/3 c Light Sour Cream", "2 tbsp Dijon Mustard, to Taste", "2 tbsp Fresh Dill, Finely Chopped", "1 tbsp Drained Capers, Finely Chopped, Plus 1 tbsp of Brine", "1 tsp Kosher Salt", "1/4 tsp Ground Black Pepper", "1 Lemon"],
      "instructions": "1. Preheat oven to 275ºF. Line rimmed baking sheet with parchment paper for easiest cleanup. Remove the salmon from the refrigerator to take some of the chill off.\n2. In a small bowl, combine the sour cream, 2 tablespoons of mustard, the dill, capers, caper brine, salt, and pepper. Zest half of the lemon into to the bowl, then cut it in half and squeeze in the juice from half. Mix to combine. The sauce should be thick but drizzle-able; if it’s too thick, add water a small splash at a time until it thins out (or more lemon juice if you like).\n3. Place the salmon, skin side down, onto lined baking sheet. Pat it dry with a paper towel. Spread a heaping spoonful (about 3 tablespoons) of the mustard sauce in a thin layer all over the salmon.\n4. Roast the salmon until it is just barely cooked through, still incredibly moist, and flakes easily with a fork when you remove it (135ºF when checked with an instant read thermometer), 35 to 50 minutes depending on the shape of your salmon.\n5. Let the salmon rest for 5 minutes, during which time it will come up another 5F.\n6. Drizzle the remaining sauce over the salmon or pass it on the side, garnish with the fresh dill sprigs, then serve.",
      "diet": ["gluten-free", "nut-free"]
    },
    {
      "image": "assets/akabob.png",
      "title": "Veggie Kabobs",
      "ingredients": ["2 Large Ears Corn, Shucked and Peeled", "1.5 Medium Red Onions, Cut into 6 Wedges", "1 Yellow Bell Pepper, Cut into 12 1-Inch Pieces", "1 Red Bell Pepper, Cut into 12 1-Inch Pieces", "1 Zucchini, Sliced into 12 Slices", "12 Cherry/Grape Tomatoes", "Olive Oil Spray", "3/4 tsp Kosher Salt", "3 tbsp BBQ Sauce", "1 tbsp Water"],
      "instructions": "1. If using wooden skewers, soak about 1 hour.\n2. Cut small ends off corn and cut each into 6 pieces, to give you 12 total.\n3. Arrange the skewers, alternating each veggie so you have 2 pieces of each vegetable on each skewer. Spritz all over with olive oil and season with salt.\n4. Preheat the grill to medium-high heat.\n5. Combine BBQ sauce and water in a small bowl.\n6. Place kabobs on the grill and cook, turning often until the vegetables are slightly charred and tender, about 10 minutes.\n7. Brush the bbq sauce on the veggies, the last minute of cooking, and turn once again.",
      "diet": ["gluten-free", "nut-free"]
    },
    // Add more recipes as needed
  ];

  