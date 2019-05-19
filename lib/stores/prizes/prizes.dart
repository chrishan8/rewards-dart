import 'package:mobx/mobx.dart';
// Classes
import '../../classes/prize.dart';
// Stores
import '../root.dart';

// Include generated file
part 'prizes.g.dart';

class PrizesStore = _PrizesStore with _$PrizesStore;

abstract class _PrizesStore implements Store {
  _PrizesStore({ this.rootStore });

  RootStore rootStore;

  @observable
  ObservableMap<String, Prize> prizes = ObservableMap.of({
    '0': Prize(
      id: '0',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 100
    ),
    '1': Prize(
      id: '1',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 200
    ),
    '2': Prize(
      id: '2',
      name: 'Flat Iron Combo',
      description: '1 Free Hot Beauty Combo Flat Iron',
      value: 300
    ),
    '3': Prize(
      id: '3',
      name: 'Flat Iron',
      description: '1 Free Hot Beauty 1in Flat Iron',
      value: 1000
    )
  });

  @observable
  ObservableMap<String, Prize> selectedPrizes = ObservableMap();

  @computed
  int get _customerPoints {
    if (rootStore.customerStore.currentCustomer == null) {
      return 0;
    }
    return rootStore.customerStore.currentCustomer['points'];
  }

  @computed
  int get _prizesIndex {
    final int _nextPrizeIndex = _sortedPrizes.indexWhere((Prize p) => p.value > _customerPoints);
    return _nextPrizeIndex != -1 ? _nextPrizeIndex : _sortedPrizes.length;
  }

  @computed
  List<Prize> get _sortedPrizes {
    List<Prize> _prizes = prizes.values.toList();
    _prizes.sort((Prize a, Prize b) => a.value.compareTo(b.value));
    return _prizes;
  }

  @computed
  List<Prize> get availablePrizes {
    if (_prizesIndex == null) {
      return [];
    }
    return _sortedPrizes.sublist(0, _prizesIndex);
  }

  @computed
  Prize get nextPrize {
    print(_prizesIndex);
    if (_prizesIndex < _sortedPrizes.length) {
      return _sortedPrizes[_prizesIndex];
    }
    return null;
  }

  @computed
  int get selectedTotalPoints {
    if (selectedPrizes.isNotEmpty) {
      return selectedPrizes.values.map((Prize p) => p.value)
        .reduce((int acc, int curr) => acc + curr);
    }
    return 0;
  }

  @action
  void onSelect(Prize p) {
    if (selectedPrizes.containsKey(p.id)) {
      selectedPrizes.remove(p.id);
    }
    else if (selectedTotalPoints + p.value <= _customerPoints) {
      selectedPrizes[p.id] = p;
    }
  }

  @action
  void redeemPrizes() {
    rootStore.customerStore.subtractPoints(selectedTotalPoints);
    selectedPrizes = ObservableMap();
  }
}