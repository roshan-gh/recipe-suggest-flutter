import 'package:flutter/material.dart';
import 'package:Frigo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Frigo/controllers/searchByIng_controller.dart';
import 'package:Frigo/models/recipe.dart';

class AddFridgeTextField extends StatelessWidget {
  const AddFridgeTextField(
      {this.width,
      this.text = 'Add Ingredients',
      this.textAction: TextInputAction.next,
      this.onPressed,
      this.onChanged,
      this.validator,
      this.controller,
      this.onSaved,
      this.obscureText = false,
      this.onFieldSubmitted});

  final double? width;
  final String text;
  final textAction;
  final VoidCallback? onPressed;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onFieldSubmitted;
  final controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    final SearchByIngController _controller =
        Get.put(SearchByIngController(Get.find<RecipeRepository>()));

    final SearchByIngTextController _textController =
        Get.put(SearchByIngTextController());

    return Container(
      width: width,
      height: 35,
      padding: EdgeInsets.symmetric(
        horizontal: 17,
      ),
      child: TextFormField(
        onFieldSubmitted: (String input) {
          _controller.addFridge(input);
          _textController.searchText.clear();
        },
        obscureText: obscureText,
        onSaved: onSaved,
        style: kFormField.copyWith(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        controller: _textController.searchText,
        validator: validator,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => _textController.searchText.clear(),
            icon: FaIcon(
              FontAwesomeIcons.times,
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
          ),
          icon: FaIcon(
            FontAwesomeIcons.search,
            color: Colors.white.withOpacity(0.7),
            size: 20,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(5.0),
          hintText: text,
          hintStyle: kFormField.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(0.7)),
          isCollapsed: true,
          errorStyle: TextStyle(fontSize: 10, color: kPrimaryColor),
        ),
        onTap: onPressed,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }
}