import 'package:azlistview/azlistview.dart';

class TestModel extends ISuspensionBean{
  String name;
  String title;

  TestModel({
    this.name,
    this.title
  });

  @override
  String getSuspensionTag() => title;
  
}