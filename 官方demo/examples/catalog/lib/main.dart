// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:sample_catalog/animated_list.dart';
import 'package:sample_catalog/app_bar_bottom.dart';
import 'package:sample_catalog/basic_app_bar.dart';
import 'package:sample_catalog/custom_a11y_traversal.dart';
import 'package:sample_catalog/expansion_tile_sample.dart';
import 'package:sample_catalog/tabbed_app_bar.dart';

void main() {
  runApp(
    // const Center(
    //   child: Text(
    //     'Instead run:\nflutter run lib/xxx.dart',
    //     textDirection: TextDirection.ltr,
    //   ),
    // ),
    // ExpansionTileSample() //类似qq好友分组折叠效果
    // AnimatedListSample()  // 动画增删列表
    // TabbedAppBarSample() //新闻资讯类分类栏
    // AppBarBottomSample() // 类似引导图效果
    // BasicAppBarSample()  //基础页面
    RowColumnTraversal()
  );
}
