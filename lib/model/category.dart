import 'package:flutter/material.dart';

import '../core/utils/app_assets.dart';

class Category {
  int id;
  String nameEn;
  String nameAr;
  String imageDark;
  String imageLight;
  IconData icon;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imageDark,
    required this.imageLight,
    required this.icon,
  });

  static List<Category> getAllCategories() {
    return [
      Category(
        id: 0,
        nameEn: 'All',
        nameAr: 'الكل',
        imageDark: '',
        imageLight: '',
        icon: Icons.grid_view_outlined,
      ),
      Category(
        id: 1,
        nameEn: 'Sport',
        nameAr: 'الرياضه',
        imageDark: AppAssets.sportDarkImage,
        imageLight: AppAssets.sportLightImage,
        icon: Icons.directions_bike_outlined,
      ),
      Category(
        id: 2,
        nameEn: 'Birthday',
        nameAr: 'عيد الميلاد',
        imageDark: AppAssets.birthdayDarkImage,
        imageLight: AppAssets.birthdayLightImage,
        icon: Icons.cake_rounded,
      ),
      Category(
        id: 3,
        nameEn: 'Meeting',
        nameAr: 'اجتماع',
        imageDark: AppAssets.meetingDarkImage,
        imageLight: AppAssets.meetingLightImage,
        icon: Icons.laptop_mac,
      ),
      Category(
        id: 4,
        nameEn: 'Exhibition',
        nameAr: 'المعرض',
        imageDark: AppAssets.exhibitionDarkImage,
        imageLight: AppAssets.exhibitionLightImage,
        icon: Icons.menu_book_rounded,
      ),
      Category(
        id: 5,
        nameEn: 'Book Club',
        nameAr: 'نادي الكتاب',
        imageDark: AppAssets.bookClubDarkImage,
        imageLight: AppAssets.bookClubLightImage,
        icon: Icons.bookmark_outline_outlined,
      ),
    ];
  }

  static List<Category> getCategories() => getAllCategories().sublist(1);

  String getCategoriesName(String languageCode) =>
      languageCode == 'ar' ? nameAr : nameEn;

  String getCategoriesImag(bool isDark) => isDark ? imageDark : imageLight;
}
