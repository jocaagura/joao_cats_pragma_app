import 'package:flutter/material.dart';
import 'package:joao_cats_pragma_app/services/service_helpers.dart';

import '../../models/model_cat.dart';

class CatNetworkImageWidget extends StatelessWidget {
  const CatNetworkImageWidget({
    Key? key,
    required this.cat,
  }) : super(key: key);

  final ModelCat cat;

  @override
  Widget build(BuildContext context) {
    if (ServiceHelpers.validateUrl(cat.urlPhoto) == true) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              cat.urlPhoto,
              fit: BoxFit.fitHeight,
            )),
      );
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
