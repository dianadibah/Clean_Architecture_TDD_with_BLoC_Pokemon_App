import '../constant/images_assets.dart';

String generatImages(int index) {
  if (index % 4 == 0) {
    return AppImages.character1;
  } else if (index % 4 == 1) {
    return AppImages.character2;
  } else if (index % 4 == 2) {
    return AppImages.character3;
  } else if (index % 4 == 3) {
    return AppImages.character4;
  } else {
    return AppImages.character2;
  }
}
