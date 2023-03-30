import 'package:flutter_application_1/model/item.dart';

import 'loc_DB.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }
  saveGoAsbeza(Item goasbeza) async {
    return await _repository!.insertData('goasbeza', goasbeza.toJson());
  }

  readGoAsbeza() async {
    return await _repository!.readData('goasbeza');
  }

  updateGoAsbeza(Item goasbeza) async {
    return await _repository!.updateData('goasbeza', goasbeza.toJson());
  }

  deleteGoAsbeza(dispatchId) async {
    return await _repository!.deleteData('goasbeza', dispatchId);
  }

  wipeDate() async {
    await _repository!.deleteAllData('goasbeza');
  }
}
