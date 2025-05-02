import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color cardBackground;
  final Color cardText;
  final VoidCallback onTap;

  const CategoryListTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.cardBackground,
    required this.cardText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50, // Height is 50px as requested
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              // Image icon
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imagePath,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
              ),

              // Spacing between icon and text
              const SizedBox(width: 15),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: cardText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Optional chevron indicator
              Icon(
                Icons.chevron_right,
                color: cardText.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
