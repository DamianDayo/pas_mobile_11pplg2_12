import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';

class ShowsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String genres;
  final String rating;
  final VoidCallback onBookmarkTap;
  final String buttonText;
  final Icon? icon;
  final Color? buttonColor;

  const ShowsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.genres,
    required this.rating,
    required this.onBookmarkTap,
    this.buttonText = "Bookmark",
    this.icon,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                width: 110,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    genres,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.neutralgraydark,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Rating: $rating",
                    style: TextStyle(
                        fontSize: 13, color: AppColor.neutralgraymedium),
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onBookmarkTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            buttonColor ?? AppColor.primaryblue,
                      ),
                      icon: icon ?? Icon(Icons.bookmark),
                      label: Text(
                        buttonText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}