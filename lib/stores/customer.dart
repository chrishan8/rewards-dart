import 'package:mobx/mobx.dart';

// Classes
import '../classes/customer.dart';

// Include generated file
part 'customer.g.dart';

enum ActionsMode {
  addPoints,
  redeemPrizes
}

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore implements Store {
  @observable
  ActionsMode mode = ActionsMode.addPoints;

  @observable
  ObservableMap currentCustomer = ObservableMap.of(
    Customer(
      email: 'fake@fake.com',
      name: 'Cool Beans',
      phone: '(888) 888-8888',
      points: 500
    ).toMap()
  );

  @action
  void dismissCustomer() {
    currentCustomer = null;
  }

  @action
  void addPoints(int value) {
    currentCustomer['points'] += value;
  }

  @action
  void setMode(ActionsMode value) {
    mode = value;
  }
}