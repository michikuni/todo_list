import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/domain/entities/todo/todo.dart';

enum CategoryType {
  grocery,
  work,
  sport,
  design,
  university,
  social,
  music,
  health,
  movie,
  home,
  createNew,
}

final List<Category> categories = [
  Category(
    name: CategoryType.grocery.name,
    icon: 'assets/icons/bread.svg',
    color: AppColors.limeGreen.toARGB32(),
  ),
  Category(
    name: CategoryType.work.name,
    icon: 'assets/icons/work.svg',
    color: AppColors.coralPeach.toARGB32(),
  ),
  Category(
    name: CategoryType.sport.name,
    icon: 'assets/icons/sport.svg',
    color: AppColors.aqua.toARGB32(),
  ),
  Category(
    name: CategoryType.design.name,
    icon: 'assets/icons/design.svg',
    color: AppColors.lightAqua.toARGB32(),
  ),
  Category(
    name: CategoryType.university.name,
    icon: 'assets/icons/university.svg',
    color: AppColors.skyBlue.toARGB32(),
  ),
  Category(
    name: CategoryType.social.name,
    icon: 'assets/icons/social.svg',
    color: AppColors.pinkishPurple.toARGB32(),
  ),
  Category(
    name: CategoryType.music.name,
    icon: 'assets/icons/music.svg',
    color: AppColors.pinkLight.toARGB32(),
  ),
  Category(
    name: CategoryType.health.name,
    icon: 'assets/icons/heart.svg',
    color: AppColors.greenMint.toARGB32(),
  ),
  Category(
    name: CategoryType.movie.name,
    icon: 'assets/icons/movie.svg',
    color: AppColors.blueSkyLight.toARGB32(),
  ),
  Category(
    name: CategoryType.home.name,
    icon: 'assets/icons/home.svg',
    color: AppColors.lightCoralRed.toARGB32(),
  ),
  Category(
    name: CategoryType.createNew.name,
    icon: 'assets/icons/create_new.svg',
    color: AppColors.aquaSoft.toARGB32(),
  ),
];
