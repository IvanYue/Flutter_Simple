import 'package:flutter/material.dart';
import 'package:hello_wold/UI/RichText-%E5%AF%8C%E6%96%87%E6%9C%AC.dart';
import 'package:hello_wold/UI/StatefulWidget.dart';


// Flutter 布局 Widget --- 单子Widget布局 和 多子Widget布局

/**
 * 单子Widget布局：就是布局 Widget 只能含有一个 子Widget 的
 *        Center(child: Text(content),)
 *     child：一个
 */   
/**
 * 多子Widget布局：就是布局 Widget 可以含有 多个子Widget的
 *        Column(children: <Widget>[Text(content),Text(content),..])
 *     children： 多个
 */

/**
 * 弹性布局 --  Flex
 *  主轴：x 轴 ，交叉轴：y轴
 *  默认  从左往右 排列
 *  Flex 和 Expanded 配合使用可以实现 子widge 按照一定比例来分配父容器空间
 *       - Flexible 会占用自身大小，而 Expanded 会占满全屏幕。
 *       - Flexible 与 Expanded 可以让 Row、Column、Flex 的 子Widget 具有弹性能力，
 *         当 子Widget 要超过主轴的大小时，会自动换行，当还有剩余空间时，Expanded 会占满剩余的所有空间，
 *         而 Flexible 只会占用自身大小的空间。 
 *       - Fexible 和 Expanded 的 flex 弹性系数
 *          - flex 为0或null,没有弹性，称为 非弹性子Widget，
 *            非弹性子Widget 的大小就是其本身的大小，不会被扩展去占用多余的空间
 *          - 如果 flex 大于0，child 是有弹性的，称为 弹性子Widget，
 *            首先会计算出第一步所有 flex为0或null 的 子Widget 的大小，
 *            然后会会按照 弹性子Widget的flex 占 所有弹性子Widget的flex 总和 的比例来分割主轴的空闲空间。
 */         


void main()=> runApp( new FlexWidget());

class FlexWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter 布局 Widget'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
            ),
            Container(
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // 使用 Flexible,flex 为 1、2、1'
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.yellow,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.green,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 30,
              height: 30,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // 按 flex 比例 瓜分
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.green,
                  ),
                ),Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
            Container(
              width: 30,
              height: 30,
            ),
            Container(
              child: Flex(
                direction: Axis.horizontal,//确定主轴的方向
                //表示 子Widget 在主轴的对齐方式
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text('使用 Flexible 来包裹 子Widget'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 30,
              height: 30,
            ),
            Container(
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded( // Expanded 是 Flexible 的子类
                    child: Container(
                      color: Colors.yellow,
                      child: Text('使用 Expanded 来包裹 子Widget'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

 
}


