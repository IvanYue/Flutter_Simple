import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';

/**
 * Flutter 容器类 Widget -  滚动widget
 *     - SingleChildScrollView
 *        - 只能包含一个 子Widget 的可滚动Widget。
 *          如果有很多 子Widget，那么需要用 ListBody 或者 Column 或者其他 Widget 来嵌套这些 子Widget，
 *          然后在 SingleChildScrollView 里使用。
 * 
 *      - ListView
 *        - ListView 是可以线性排列 子Widget 的可滚动Widget。
 *        - ListView 可以和数据绑定用来实现瀑布流。
 *        - 如果有很多 子Widget，能使用 ListView 的就不要使用 SingleChildScrollView，
 *          因为 ListView 的性能比 SingleChildView 好。
 *        - ListView 的辅助 Widget
 *           - ListTile：一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标。
 *           - Stepper：一个 Material Design 步骤指示器，显示一系列步骤的过程
 *           - Divider：一个逻辑1像素厚的水平分割线，两边都有填充
 * 
 *       - CustomScrollView
 *          - CustomScrollView 是可以使用 slivers 来自定义滑动效果的可滚动Widget。
 *          - slivers : 以 Sliver 开头的一系列 Widget
 *             - SliverList、SliverGrid、SliverAppBar
 *             - 具有特定滚动效果的可滚动块，它们只能用在 CustomScrollView 里，
 *               多个 Sliver 拼在 CustomScrollView 里来实现特定的效果。
 *          - CustomScrollView 也可以实现 ListView 的功能
 *             - CustomScrollView 不像 SingleChildScrollView 一样只能包含一个 子Widget
 *             - CustomScrollView 可以实现比 ListView 更复杂的滑动效果，例如：吸顶，
 *                所以当 ListView 不能实现一些滑动效果时，就应该使用 CustomScrollView，
 *                但是如果没有特殊的效果，而是数据展示，就使用 ListView。
 *       
 *      - GridView：可以构建二维网格列表的 可滚动Widget。
 *      - PageView：PageView 是可以一页一页滑动的 可滚动Widet。
 * 
 */         


void main()=> runApp( new FlexWidget());

class FlexWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter 容器 - 滚动widget'),
        ),
      
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,// 滑动方向
        padding: EdgeInsets.all(50),//内边距
        reverse:false,//是否从头开始滑动 默认false 从头开始
        primary:true,//内容不足时，是否也可以滚动
        /*
         *  设置 SingleChildScrollView 的滚动效果
         *  如果想让 SingleChildScrollView 里没有足够的内容也能滑动，则设置为 AlwaysScrollableScrollPhysics()
         *  如果想让 SingleChildScrollView 在没有足够的内容的时候不能滑动，则设置为 ScrollPhysics()	
         */
        physics: AlwaysScrollableScrollPhysics(),
        /**
         *  可以控制 SingleChildScrollView 滚动的位置
         *  当 primary 为 true 时，controller 必须为 null
         *  ScrollController 提供以下的几个功能：
         *     1.设置 SingleChildScrollView 滑动的初始位置
         *     2.可以控制 SingleChildScrollView 是否存储和恢复滑动的位置
         *     3.可以读取、设置当前滑动的位置
         */
        controller: null,//ScrollController()
        child: Row(
          children: <Widget>[
            Text('Hello Flutter ' * 100),
          ],
        ),
        
      ),
      ),
    );
  }

 
}


