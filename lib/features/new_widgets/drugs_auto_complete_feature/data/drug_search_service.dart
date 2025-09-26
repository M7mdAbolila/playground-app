import 'drug_model.dart';
import 'drug_repo.dart';

class DrugSearchService {
  final DrugRepository _repository;

  const DrugSearchService(this._repository);

  Future<List<Drug>> searchDrugs(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    return await _repository.searchDrugsByTradename(query.trim());
  }
}