import 'package:avito_test/theme.dart';
import 'package:flutter/material.dart';

import 'all_categories_screen.dart';
import 'detail_screen.dart';
import 'list_item.dart';

class DriveScreen extends StatefulWidget {
  const DriveScreen({super.key});

  @override
  State<DriveScreen> createState() => _DriveScreenState();
}

class _DriveScreenState extends State<DriveScreen> {
  // Add selection state variables
  int? selectedIndex;
  int? selectedRow; // 0 for top row, 1 for bottom row

  final List<ListItem> list1 = [
    ListItem(
      title: 'Услуги',
      imagePath: 'assets/images/image1.png',
      width: 180,
    ),
    ListItem(
      title: 'Двигатель и запчасти',
      imagePath: 'assets/images/image2.png',
      width: 180,
    ),
    ListItem(
      title: 'Трансмис-сия',
      imagePath: 'assets/images/image3.png',
      width: 120,
    ),
    ListItem(
      title: 'Детали ходовой части',
      imagePath: 'assets/images/image4.png',
      width: 180,
    ),
    ListItem(
      title: 'Cистема  охлаждения',
      imagePath: 'assets/images/image5.png',
      width: 180,
    ),
    ListItem(
      title: 'Рулувая часть',
      imagePath: 'assets/images/image6.png',
      width: 180,
    ),
    ListItem(
      title: 'Тормозная система',
      imagePath: 'assets/images/image7.png',
      width: 170,
    ),
  ];

  final List<ListItem> list2 = [
    ListItem(
      title: 'Электро-ника',
      imagePath: 'assets/images/image8.png',
      width: 120,
    ),
    ListItem(
      title: 'Оптика',
      imagePath: 'assets/images/image9.png',
      width: 110,
    ),
    ListItem(
      title: 'Кузовные элементы',
      imagePath: 'assets/images/image10.png',
      width: 160,
    ),
    ListItem(
      title: 'Cалон и интерьер',
      imagePath: 'assets/images/image11.png',
      width: 160,
    ),
    ListItem(
      title: 'Масло и автохимия',
      imagePath: 'assets/images/image12.png',
      width: 160,
    ),
    ListItem(
      title: 'Шины и диски',
      imagePath: 'assets/images/image13.png',
      width: 240,
    ),
    ListItem(
      title: 'Тюнкинг и стайлинг',
      imagePath: 'assets/images/image14.png',
      width: 240,
    ),
  ];

  final List<ListItem> list3 = [
    ListItem(
      title: 'Автоаксессуары',
      imagePath: 'assets/images/image15.png',
      width: 180,
    ),
    ListItem(
      title: 'Запчасти спецтехники',
      imagePath: 'assets/images/image16.png',
      width: 180,
    ),
    ListItem(
      title: 'Мото запчасти',
      imagePath: 'assets/images/image17.png',
      width: 180,
    ),
    ListItem(
      title: 'Авто на разбор',
      imagePath: 'assets/images/image18.png',
      width: 180,
    ),
  ];

  void onCategoryTap(int row, int index, ListItem item) {
    // Update selection state
    setState(() {
      selectedRow = row;
      selectedIndex = index;
    });

    // Navigate to detail screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(title: item.title)),
    );
  }

  void onViewAllTap() {
    // Update selection state
    setState(() {
      selectedRow = null;
      selectedIndex = 9999; // Special value for "View All"
    });

    // Navigate to all categories screen with both lists
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AllCategoriesScreen(
          list1: list1,
          list2: list2,
          list3: list3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get theme colors
    final CustomColors customColors =
        Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Two-row category carousel with single scroll
            SizedBox(
              height: 198, // Height for both rows + spacing
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left fixed padding
                  const SizedBox(width: 8),

                  // Main scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Two rows stacked vertically
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top row
                              SizedBox(
                                height: 95,
                                child: Row(
                                  children: List.generate(
                                    list1.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: GestureDetector(
                                        onTap: () => onCategoryTap(
                                            0, index, list1[index]),
                                        child: CategoryCard(
                                          imagePath: list1[index].imagePath,
                                          title: list1[index].title,
                                          width: list1[index].width,
                                          height: 95,
                                          isSelected: selectedRow == 0 &&
                                              selectedIndex == index,
                                          cardBackground:
                                              customColors.cardBackground,
                                          cardText: customColors.cardText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6), // Space between rows

                              // Bottom row
                              SizedBox(
                                height: 95,
                                child: Row(
                                  children: List.generate(
                                    list2.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: GestureDetector(
                                        onTap: () => onCategoryTap(
                                            1, index, list2[index]),
                                        child: CategoryCard(
                                          imagePath: list2[index].imagePath,
                                          title: list2[index].title,
                                          width: list2[index].width,
                                          height: 95,
                                          isSelected: selectedRow == 1 &&
                                              selectedIndex == index,
                                          cardBackground:
                                              customColors.cardBackground,
                                          cardText: customColors.cardText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // "View All" button at the end (spans both rows)
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: GestureDetector(
                              onTap: onViewAllTap,
                              child: ViewAllCard(
                                width: 100,
                                height: 196, // Height of both rows + spacing
                                isSelected: selectedIndex == 9999,
                                cardBackground:
                                    customColors.viewAllCardBackground,
                                cardText: customColors.cardText,
                              ),
                            ),
                          ),

                          // Add some padding at the end
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),

                  // Right fixed padding
                  const SizedBox(width: 8),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Mechanics section (from original code)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Мастера',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://30.img.avito.st/image/1/1.YoYY8baxBBOs4sndq6xSkjOSzm2uUMhr.dJCmMGDWcT-WLpBZt6ROL8nVV0L-pChGW7n3bKaG0lA',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Механик',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;
  final double height;
  final bool isSelected;
  final Color cardBackground;
  final Color cardText;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.width,
    this.height = 90,
    this.isSelected = false,
    required this.cardBackground,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[300] : cardBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Text positioned at top-left
          Positioned(
            top: 15,
            left: 15,
            child: SizedBox(
              width: width * 0.6,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : cardText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // Image positioned at bottom-right
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: height * 0.65,
                width: width * 0.55,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewAllCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isSelected;
  final Color cardBackground;
  final Color cardText;

  const ViewAllCard({
    super.key,
    required this.width,
    this.height = 90,
    this.isSelected = false,
    required this.cardBackground,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[300] : cardBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Посмотреть все',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : cardText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'категории',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : cardText,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.arrow_right_alt_rounded,
                color: isSelected ? Colors.black : cardText,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
