import 'package:flutter/material.dart';
import 'package:greengrocer/src/shared/data/app_data.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/category_tile_widget.dart';
import 'package:greengrocer/src/shared/widgets/item_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Tudo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: AppColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: AppColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: AppColors.customContrastColor,
                label: const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: AppColors.customSwatchColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            //CAMPO DE PESQUISA
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6000),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.customContrastColor,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //CATEGORIES
            SizedBox(
              height: 40,
              child: ListView.separated(
                itemBuilder: (context, index) => CategoryTileWidget(
                  category: AppData().categories[index],
                  isSelected: AppData().categories[index].toLowerCase() ==
                          selectedCategory.toLowerCase()
                      ? true
                      : false,
                  onPressed: () {
                    setState(() {
                      selectedCategory = AppData().categories[index];
                    });
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: AppData().categories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //GRID
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7826086956521739,
                ),
                itemCount:
                    AppData().getItems(category: selectedCategory).length,
                itemBuilder: (context, index) => ItemTileWidget(
                  item: AppData().getItems()[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
