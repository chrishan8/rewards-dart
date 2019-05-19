import 'package:mobx/mobx.dart';
// Stores
import 'customer/customer.dart';
import 'prizes/prizes.dart';

// Include generated file
part 'root.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore implements Store {
  CustomerStore customerStore;
  PrizesStore prizesStore;

  _RootStore() {
    customerStore = CustomerStore(rootStore: this);
    prizesStore = PrizesStore(rootStore: this);
  }
}