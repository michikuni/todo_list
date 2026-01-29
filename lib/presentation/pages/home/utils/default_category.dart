import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';

final List<Category> categories = [
  Category(
    name: "Grocery",
    icon: 'assets/icons/bread.svg',
    color: AppColors.limeGreen.toARGB32(),
  ),
  Category(
    name: "Work",
    icon: 'assets/icons/work.svg',
    color: AppColors.coralPeach.toARGB32(),
  ),
  Category(
    name: "Sport",
    icon: 'assets/icons/sport.svg',
    color: AppColors.aqua.toARGB32(),
  ),
  Category(
    name: "Design",
    icon: 'assets/icons/design.svg',
    color: AppColors.lightAqua.toARGB32(),
  ),
  Category(
    name: "University",
    icon: 'assets/icons/university.svg',
    color: AppColors.skyBlue.toARGB32(),
  ),
  Category(
    name: "Social",
    icon: 'assets/icons/social.svg',
    color: AppColors.pinkishPurple.toARGB32(),
  ),
  Category(
    name: "Music",
    icon: 'assets/icons/music.svg',
    color: AppColors.pinkLight.toARGB32(),
  ),
  Category(
    name: "Health",
    icon: 'assets/icons/heart.svg',
    color: AppColors.greenMint.toARGB32(),
  ),
  Category(
    name: "Movie",
    icon: 'assets/icons/movie.svg',
    color: AppColors.blueSkyLight.toARGB32(),
  ),
  Category(
    name: "Home",
    icon: 'assets/icons/home.svg',
    color: AppColors.lightCoralRed.toARGB32(),
  ),
  Category(
    name: "Create New",
    icon: 'assets/icons/create_new.svg',
    color: AppColors.aquaSoft.toARGB32(),
  ),
];