// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/api_responses.dart';
import 'package:wallpapers_app_flutter/Model/models.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route_name.dart';

class MasonaryGrid extends StatelessWidget {
  ApiResponse<ImagesModel> homeViewModel;
  MasonaryGrid({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: homeViewModel.data?.photos?.length,
      itemBuilder: (context, index) {
        final photo = homeViewModel.data?.photos?[index];

        if (photo?.src?.portrait != null) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {
                final args = ImageViewArguments(
                    imageUrl: photo.src!.portrait.toString());
                Navigator.pushNamed(context, RoutNames.img_view,
                    arguments: args);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  photo!.src!.medium.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          return Text(homeViewModel.message
              .toString()); // Or any placeholder widget you want
        }
      },
    );
  }
}
