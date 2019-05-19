// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prizes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PrizesStore on _PrizesStore, Store {
  Computed<int> _$_customerPointsComputed;

  @override
  int get _customerPoints =>
      (_$_customerPointsComputed ??= Computed<int>(() => super._customerPoints))
          .value;
  Computed<int> _$_prizesIndexComputed;

  @override
  int get _prizesIndex =>
      (_$_prizesIndexComputed ??= Computed<int>(() => super._prizesIndex))
          .value;
  Computed<List<Prize>> _$_sortedPrizesComputed;

  @override
  List<Prize> get _sortedPrizes => (_$_sortedPrizesComputed ??=
          Computed<List<Prize>>(() => super._sortedPrizes))
      .value;
  Computed<List<Prize>> _$availablePrizesComputed;

  @override
  List<Prize> get availablePrizes => (_$availablePrizesComputed ??=
          Computed<List<Prize>>(() => super.availablePrizes))
      .value;
  Computed<Prize> _$nextPrizeComputed;

  @override
  Prize get nextPrize =>
      (_$nextPrizeComputed ??= Computed<Prize>(() => super.nextPrize)).value;
  Computed<int> _$selectedTotalPointsComputed;

  @override
  int get selectedTotalPoints => (_$selectedTotalPointsComputed ??=
          Computed<int>(() => super.selectedTotalPoints))
      .value;

  final _$prizesAtom = Atom(name: '_PrizesStore.prizes');

  @override
  ObservableMap<String, Prize> get prizes {
    _$prizesAtom.reportObserved();
    return super.prizes;
  }

  @override
  set prizes(ObservableMap<String, Prize> value) {
    _$prizesAtom.context.checkIfStateModificationsAreAllowed(_$prizesAtom);
    super.prizes = value;
    _$prizesAtom.reportChanged();
  }

  final _$selectedPrizesAtom = Atom(name: '_PrizesStore.selectedPrizes');

  @override
  ObservableMap<String, Prize> get selectedPrizes {
    _$selectedPrizesAtom.reportObserved();
    return super.selectedPrizes;
  }

  @override
  set selectedPrizes(ObservableMap<String, Prize> value) {
    _$selectedPrizesAtom.context
        .checkIfStateModificationsAreAllowed(_$selectedPrizesAtom);
    super.selectedPrizes = value;
    _$selectedPrizesAtom.reportChanged();
  }

  final _$_PrizesStoreActionController = ActionController(name: '_PrizesStore');

  @override
  void onSelect(Prize p) {
    final _$actionInfo = _$_PrizesStoreActionController.startAction();
    try {
      return super.onSelect(p);
    } finally {
      _$_PrizesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void redeemPrizes() {
    final _$actionInfo = _$_PrizesStoreActionController.startAction();
    try {
      return super.redeemPrizes();
    } finally {
      _$_PrizesStoreActionController.endAction(_$actionInfo);
    }
  }
}
