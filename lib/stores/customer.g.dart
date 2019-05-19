// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CustomerStore on _CustomerStore, Store {
  final _$currentCustomerAtom = Atom(name: '_CustomerStore.currentCustomer');

  @override
  Customer get currentCustomer {
    _$currentCustomerAtom.reportObserved();
    return super.currentCustomer;
  }

  @override
  set currentCustomer(Customer value) {
    _$currentCustomerAtom.context
        .checkIfStateModificationsAreAllowed(_$currentCustomerAtom);
    super.currentCustomer = value;
    _$currentCustomerAtom.reportChanged();
  }

  final _$_CustomerStoreActionController =
      ActionController(name: '_CustomerStore');

  @override
  void dismissCustomer() {
    final _$actionInfo = _$_CustomerStoreActionController.startAction();
    try {
      return super.dismissCustomer();
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }
}
