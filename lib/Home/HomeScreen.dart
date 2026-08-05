import 'package:flutter/material.dart';
import 'package:fresh_fruits_final/Home/CategoryScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(activeIndex: 0,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderSection(),
              const SizedBox(height: 20),
              const _PromoBanners(),
              const SizedBox(height: 24),
              const _SectionHeader(title: 'Categories'),
              const SizedBox(height: 12),
              const _CategoriesRow(),
              const SizedBox(height: 24),
              const _SectionHeader(title: 'Trending Deals'),
              const SizedBox(height: 12),
              const _TrendingDealsGrid(),
              const SizedBox(height: 20),
              const _MoreButton(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(height: 4),
            Text(
              'Rafatul Islam',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black87,
              ),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PromoBanners extends StatelessWidget {
  const _PromoBanners();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _PromoCard(
              title: 'Recommended\nRecipe Today',
              imageUrl: 'assets/images/rec1.png',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: _PromoCard(
              title: 'Fresh\nDelivery',
              imageUrl: 'assets/images/rec2.png',
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const _PromoCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover, width: 263, height: 162),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_forward, size: 18),
        ),
      ],
    );
  }
}

class _CategoriesRow extends StatelessWidget {
  const _CategoriesRow();

  final List<String> icons = const [
    "assets/images/cat1.png",
    "assets/images/cat2.png",
    "assets/images/cat3.png",
    "assets/images/cat4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: icons
            .map(
              (icon) =>
              Container(
                width: 93,
                height: 73,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image(image: AssetImage(icon)),
              ),
        )
            .toList(),
      ),
    );
  }
}

class _TrendingDealsGrid extends StatelessWidget {
  const _TrendingDealsGrid();

  @override
  Widget build(BuildContext context) {
    final deals = [
      Item.item('Avocado', '\$6.7', "assets/images/item1.png", liked: true),
      Item.item('Brocoli', '\$8.7', 'assets/images/item2.png', liked: true),
      Item.item('Tomatoes', '\$4.9', 'assets/images/item3.png', liked: false),
      Item.item('Grapes', '\$7.2', 'assets/images/item4.png', liked: false),
    ];

    return GridView.builder(
      itemCount: deals.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, i) => ItemCard(item: deals[i]),
    );
  }
}

class Item {
  final String name;
  final String price;
  final String imageUrl;
  final bool liked;

  Item.item(this.name, this.price, this.imageUrl, {required this.liked});
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(item.imageUrl, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Icon(
              item.liked ? Icons.favorite : Icons.favorite_border,
              color: item.liked ? Colors.pinkAccent : Colors.white,
              size: 20,
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.price,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'More',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int activeIndex;

  const BottomNavBar({super.key, required this.activeIndex,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          GestureDetector(
            onTap: () {
              if (activeIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
            },
            child: _navIcon(Icons.home, active: activeIndex == 0),
          ),
          GestureDetector(
              onTap: () {
                if (activeIndex != 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(),
                    ),
                  );
                }
              },
              child: _navIcon(Icons.swap_horiz, active: activeIndex == 1),
          ),
          _navIcon(Icons.shopping_bag_outlined, active: false),
          _navIcon(Icons.favorite_border, active: false),
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=200',
            ),
          ),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, {required bool active}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? Colors.orange : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: active ? Colors.white : Colors.grey),
    );
  }
}
