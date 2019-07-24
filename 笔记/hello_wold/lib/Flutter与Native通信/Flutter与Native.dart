import 'package:flutter/material.dart';

/**
 * Flutter 与 Native 之间采用的是消息传递的模式，一个是 Client，一个是 Host：
 *     - Client 通过 PlatformChannel 向 Host 发送消息。
 *     - Host 监听 PlatformChannel，接受消息，然后将响应结果发送给 Client。
 *       这样就完成了 Flutter 与 Native 之间的消息传递。
 *     - 而且 Flutter 与 Native 之间的消息传递都是异步的，所以不会阻塞 UI。
 * 
 * 而且由于 PlatformChannel 是双工的，所以 Flutter 和 Native 可以互相做 Client 和 Host。
 * PlatformChannel 种类
 *      - MethodChannel 以方法模式
 *      - EventChannel  以事件模式
 *      - BasicMessageChannel  自定义扩展，主要用于个性化的扩展
 */

/**
 * codec 消息编解码：只能支持一些基本数据类型的传递
 *      - 首先将 Client 端平台的数据进行编码，然后通过 PlatformChannel 发送
 *      - Host 端接受到消息后，将消息解码成Host端平台的数据类型
 *      - Host 端向 Client 端发送回应的消息，同样要先进行编码后，才能发送
 *      - Client 端接收到消息后，将消息解码成 Client 端平台的数据类型
 * 
 * 分类：
 *     1.MethodCodec 是一个接口
 *        - StandartMethodCodec：可以编解码 PlatformChannel 支持的所有类型的数据
 *        - JSONMethodCodec：只可以编解码 JSON 类型的数据
 *     2.MessageCodec 是一个接口
 *        - StandardMessageCodec：可以编解码 PlatformChannel 支持的所有类型的数据
 *        - BinaryCodec：只可以编解码 byte 类型的数据
 *        - StringCodec：只可以编解码 String 类型的数据
 *        - JSONMessageCodec：只可以编解码 JSON 类型的数据
 * 
 * PlatformChannel 支持的数据类型
 * Flutter	  Android	                      iOS
 * null	        null	            nil (NSNull when nested)
 * bool	  java.lang.Boolean	      NSNumber numberWithBool:
 * int	  java.lang.Integer	      NSNumber numberWithInt:
 * int不足32字节, 	java.lang.Long	      NSNumber numberWithLong:
 * double	java.lang.Double	      NSNumber numberWithDouble:
 * String	java.lang.String	      NSString
 * Uint8List	  byte[]	          FlutterStandardTypedData typedDataWithBytes:
 * Int32List	  int[]	            FlutterStandardTypedData typedDataWithInt32:
 * Int64List	  long[]	          FlutterStandardTypedData typedDataWithInt64:
 * Float64List	double[]	        FlutterStandardTypedData typedDataWithFloat64:
 * List	    java.util.ArrayList	  NSArray
 * Map	    java.util.HashMap	    NSDictionary
 */     


