import 'package:injectable/injectable.dart';

@LazySingleton(as: IStorageRepository)
class StorageRepository implements IStorageRepository {}

abstract class IStorageRepository {
}
