import 'package:joao_cats_pragma_app/models/model_cat.dart';
import 'package:test/test.dart';


void main(){
  group('Testing model cat', (){
    test('Create cat model from nothing', (){
      final ModelCat modelCat = ModelCat();
      expect(modelCat.breedName, 'anonymous');
      expect(modelCat.origin, 'Colombia');
      expect(modelCat.affectionLevel, 0);
      expect(modelCat.urlPhoto, '');
      expect(modelCat.intelligence, 0);
    });
    test('Create cat model from nul json', (){
      final ModelCat modelCat = ModelCat.fromJson({});
      expect(modelCat.breedName, 'NA');
      expect(modelCat.origin, 'NA');
      expect(modelCat.affectionLevel, 0);
      expect(modelCat.urlPhoto, '');
      expect(modelCat.intelligence, 0);
    });
  });
}