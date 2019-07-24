import 'dart:core';

class InitCount{
  InitCount();
}

class ChangeCountAction{

  int _count;
  get count =>_count;
  ChangeCountAction(this._count);

}


class CountAddAction{
  int _count;
  get count =>_count;
  CountAddAction(this._count);
}

class CountRemoveAction{

  int _count;
  get count=>_count;
  CountRemoveAction(this._count);
}
