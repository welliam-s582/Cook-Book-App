class Recipe {
  String title;
  String description;
  String image;
  double stars;
  double protein;
  double calories;
  //List<String> ingredients;

  Recipe(this.title, this.description, this.image, this.stars, this.protein,
      this.calories);
}

List<Recipe> getRecentRecipe() {
  return <Recipe>[
    Recipe("Fried Rice", "A delecate Chinesse fried rice.",
        "assets/images/nasgor_hkg.jpeg", 4.5, 100, 100),
    Recipe("Dumpling Noodle", "Big noodel with dumplins.",
        "assets/images/miepangsit.jpg", 4, 100, 100),
    Recipe("Fu Yung Hai", "Fried Crab Meat with sweat sauce.",
        "assets/images/fuyunghai.jpeg", 4.8, 100, 100),
  ];
}

List<Recipe> getPopularRecipe() {
  return <Recipe>[
    Recipe("Fu Yung Hai", "Fried Crab Meat with sweat sauce.",
        "assets/images/fuyunghai.jpeg", 4.8, 100, 100),
    Recipe("Cap Cay", "Vegtable soup mix with pork and Seafood.",
        "assets/images/capcay.jpeg", 4.3, 100, 100),
    Recipe("Sweet&Sour Pork", "Fried Pork with Sweet and Sour Sauce.",
        "assets/images/kolobak.jpg", 4.5, 100, 100),
    Recipe("Spring Roll", "Big noodel with dumplins.",
        "assets/images/spring_rolls.jpg", 4, 100, 100),
    Recipe("Fried Noodle", "Fried Crab Meat with sweat sauce.",
        "assets/images/miegrg.jpg", 3.8, 100, 100),
    Recipe("Tofu Soup", "Fried tofu soup with mushroom.",
        "assets/images/sapotahu.jpg", 4.2, 100, 100),
  ];
}
