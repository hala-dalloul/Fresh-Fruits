import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const Color primaryOrange = Color(0xFFF7941D);

  @override
  Widget build(BuildContext context) {
    final categories = [
      _CategoryItem('Fruits', '87 Items', "assets/images/category1.png", isSelected: true),
      _CategoryItem('Vegetables', '87 Items', "assets/images/category2.png"),
      _CategoryItem('Mushroom', '87 Items', "assets/images/category3.png"),
      _CategoryItem('Dairy', '87 Items', "assets/images/category4.png"),
      _CategoryItem('Oats', '87 Items', "assets/images/category5.png"),
      _CategoryItem('Bread', '87 Items', "assets/images/category6.png"),
      _CategoryItem('Rice', '87 Items', "assets/images/category7.png"),
      _CategoryItem('Egg', '120 Items', "assets/images/category8.png"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return _CategoryCard(item: item);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(activeIndex: 1,),
    );
  }

}

class _CategoryItem {
  final String title;
  final String subtitle;
  final String icon;
  final bool isSelected;

  _CategoryItem(this.title, this.subtitle, this.icon, {this.isSelected = false});
}

class _CategoryCard extends StatelessWidget {
  final _CategoryItem item;

  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final bool selected = item.isSelected;
    final Color bgColor = selected ? CategoriesScreen.primaryOrange : const Color(0xFFF6F6F6);
    final Color contentColor = selected ? Colors.white : CategoriesScreen.primaryOrange;
    final Color textColor = selected ? Colors.white : Colors.black87;
    final Color subTextColor = selected ? Colors.white70 : CategoriesScreen.primaryOrange;

    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          // TODO: navigate to category products list
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item.icon, width: 48, color: contentColor),
              const SizedBox(height: 10),
              Text(
                item.title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                style: TextStyle(
                  color: subTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}