import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';

class ShowsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String genres;
  final String rating;
  final VoidCallback onFavoriteTap;
  final String? text;
  final Icon? prefixIcon;
  final Color? buttonCollor;

  const ShowsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.genres,
    required this.rating,
    required this.onFavoriteTap,
    this.text,
    this.prefixIcon,
    this.buttonCollor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        shadowColor: AppColor.neutralgraydark,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 15),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),
              Text(
                genres,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),
              Text(
                rating,
                style: TextStyle(fontSize: 13, color: AppColor.neutralgraydark),
              ),

              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onFavoriteTap,
                  icon:
                      prefixIcon ??
                      Icon(Icons.bookmark, color: AppColor.neutrallight),
                  label: Text(
                    text ?? "Button",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.neutrallight,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonCollor ?? AppColor.primaryblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}