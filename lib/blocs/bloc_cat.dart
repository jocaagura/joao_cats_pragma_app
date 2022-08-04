import 'dart:async';

import '../models/model_cat.dart';
import '../services/service_http.dart';

class BlocCat {
  BlocCat({required this.serviceHttp}) {
    getCats();
  }

  List<ModelCat> _listOfCats = <ModelCat>[];
  final _listOfCatsController = StreamController<List<ModelCat>>()
    ..sink.add([]);

  final ServiceHttp serviceHttp;

  List<ModelCat> get cats => _listOfCats;

  Stream<List<ModelCat>> get catsStream => _listOfCatsController.stream;

  getCats() {
    getListOfCats();
  }

  void getListOfCats() async {
    final tmp = await serviceHttp.listGetRequestHttp(
        url: 'https://api.thecatapi.com/v1/breeds',
        headers: {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'});
    final tmpListOfCats = <ModelCat>[];
    for (final json in tmp) {
      tmpListOfCats.add(ModelCat.fromJson(json));
    }
    _addToStream(tmpListOfCats);
  }

  void _addToStream(List<ModelCat> modelCatsList) {
    _listOfCats = modelCatsList;
    _listOfCatsController.sink.add(modelCatsList);
  }
}

final blocCat = BlocCat(serviceHttp: ServiceHttp());
