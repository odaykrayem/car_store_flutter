// ignore_for_file: file_names
import '../models/exhibitions/exhibition_model.dart';
import '../repositories/exhibition_repository.dart';

class ExhibitionProvider {
  final ExhibitionRepository _exhibitionRepository;

  ExhibitionProvider(this._exhibitionRepository);

  Future<List<ExhibitionModel>> getStores() async {
    var stores = await _exhibitionRepository.getStores();
    return stores;
  }
}
