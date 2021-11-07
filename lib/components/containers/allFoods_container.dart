import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Frigo/controllers/findAllRecipe_controller.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:Frigo/controllers/pageContents_controller.dart';
import 'package:Frigo/components/food.dart';

class AllFoodsContainer extends StatelessWidget {
  final FindAllRecipeController _controller =
      Get.put(FindAllRecipeController(Get.find<RecipeRepository>()));

  final PageContentsController contentsController =
      Get.put(PageContentsController());
  @override
  Widget build(BuildContext context) {
    return Food(controller: _controller, contentsController: contentsController);
  }
}


