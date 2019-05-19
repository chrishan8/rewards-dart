import 'package:mobx/mobx.dart';

// Classes
import '../classes/customer.dart';

// Include generated file
part 'customer.g.dart';

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore implements Store {
  @observable
  Customer currentCustomer = Customer(
    email: 'fake@fake.com',
    name: 'Cool Beans',
    phone: '(888) 888-8888',
    points: 500
  );

  // @observable
  // ObservableMap currentCustomer = ObservableMap.of({
  //   'email': 'fake@fake.com',
  //   'name': 'Cool Beans',
  //   'phone': '(888) 888-8888',
  //   'points': 500
  // });

  @action
  void dismissCustomer() {
    currentCustomer = null;
    print(currentCustomer);
  }
}