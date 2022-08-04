import 'package:flutter/material.dart';
import 'package:joao_cats_pragma_app/models/model_cat.dart';
import 'package:joao_cats_pragma_app/views/widgets/cat_network_image_widget.dart';

class CatCardWidget extends StatelessWidget {
  const CatCardWidget({Key? key, required this.catModel}) : super(key: key);

  final ModelCat catModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.width * 0.85;
    final titleHeight = height * 0.1;
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).primaryColorDark,
              style: BorderStyle.solid,
              width: 1.0)),
      width: size.width,
      height: height,
      child: Column(
        children: [
          SizedBox(
              width: size.width,
              height: titleHeight,
              child: Text(
                catModel.breedName,
                textAlign: TextAlign.start,
              )),
          Expanded(child: CatNetworkImageWidget(cat: catModel)),
          SizedBox(
              width: size.width,
              height: titleHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible( child: Text(catModel.origin)),
                  Flexible(
                      flex: 2, child: Text('Inteligencia: ${catModel.intelligence.toString()}'))
                ],
              )),
        ],
      ),
    );
  }
}
