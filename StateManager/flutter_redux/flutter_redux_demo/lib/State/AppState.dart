class AppState {
  CountState _countState;
  get countState => _countState;
  AppState(this._countState);
}

class CountState {
  int _count;
  get count =>_count;
  CountState(this._count);
}
