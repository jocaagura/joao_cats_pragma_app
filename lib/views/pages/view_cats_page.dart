import 'package:flutter/material.dart';
import 'package:joao_cats_pragma_app/views/widgets/cat_network_image_widget.dart';

import '../../blocs/bloc_cat.dart';
import '../../models/model_cat.dart';
import '../widgets/cat_card_widget.dart';

class ViewCatsPage extends StatelessWidget {
  const ViewCatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blocCat.catsStream,
      builder: (context, AsyncSnapshot<List<ModelCat>> snapshot) {
        if (blocCat.cats.isNotEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(
                  'CatBreeds',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: blocCat.cats.length,
                    itemBuilder: (context, index) {
                      final cat = blocCat.cats[index];
                      return CatCardWidget(
                        catModel: cat,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Center(child: CatNetworkImageWidget(cat: ModelCat()));
      },
    );
  }
}
