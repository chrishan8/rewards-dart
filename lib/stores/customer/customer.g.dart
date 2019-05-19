// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CustomerStore on _CustomerStore, Store {
  final _$modeAtom = Atom(name: '_CustomerStore.mode');

  @override
  ActionsMode get mode {
    _$modeAtom.reportObserved();
    return super.mode;
  }

  @override
  set mode(ActionsMode value) {
    _$modeAtom.context.checkIfStateModificationsAreAllowed(_$modeAtom);
    super.mode = value;
    _$modeAtom.reportChanged();
  }

  final _$currentCustomerAtom = Atom(name: '_CustomerStore.currentCustomer');

  @override
  ObservableMap get currentCustomer {
    _$currentCustomerAtom.reportObserved();
    return super.currentCustomer;
  }

  @override
  set currentCustomer(ObservableMap value) {
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

  @override
  void addPoints(int value) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction();
    try {
      return super.addPoints(value);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subtractPoints(int value) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction();
    try {
      return super.subtractPoints(value);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMode(ActionsMode value) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction();
    try {
      return super.setMode(value);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }
}
