import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../app/l10n/generated/l10n.dart';
import '../../app/theme/app_theme.dart';

part 'base_confirm.dart';
part 'base_toast.dart';

class DialogUtils {
  DialogUtils._();

  static const AlignmentGeometry _defaultAlignment = Alignment.bottomCenter;

  static Color get _maskBackground => Colors.transparent;

  static Future<void> loading() async {
    await SmartDialog.showLoading<void>(
      maskColor: _maskBackground,
    );
  }

  static Future<void> dismiss(
      {SmartStatus status = SmartStatus.loading}) async {
    await SmartDialog.dismiss<void>(
      status: status,
    );
  }

  static Future<void> tips(
    String msg, {
    AlignmentGeometry? alignment,
  }) async =>
      await SmartDialog.showToast(
        '',
        maskColor: _maskBackground,
        builder: (BuildContext context) => BaseToast(
          type: ToastType.tips,
          alignment: alignment ?? _defaultAlignment,
          msg: msg,
        ),
      );

  static Future<void> success(
    String msg, {
    AlignmentGeometry? alignment,
  }) async =>
      await SmartDialog.showToast(
        '',
        maskColor: _maskBackground,
        builder: (BuildContext context) => BaseToast(
          type: ToastType.success,
          alignment: alignment ?? _defaultAlignment,
          msg: msg,
        ),
      );

  static Future<void> danger(
    String msg, {
    AlignmentGeometry? alignment,
  }) async =>
      await SmartDialog.showToast(
        '',
        maskColor: _maskBackground,
        displayTime: const Duration(seconds: 1),
        builder: (BuildContext context) => BaseToast(
          type: ToastType.danger,
          alignment: alignment ?? _defaultAlignment,
          msg: msg,
        ),
      );

  static Future<void> waring(
    String msg, {
    AlignmentGeometry? alignment,
  }) async =>
      await SmartDialog.showToast(
        '',
        maskColor: _maskBackground,
        builder: (BuildContext context) => BaseToast(
          type: ToastType.waring,
          alignment: alignment ?? _defaultAlignment,
          msg: msg,
        ),
      );

  /// 确认弹窗 [builder] 内容
  /// [title] 标题 默认为提示
  /// [confirmText] 确认按钮文本 默认为确定
  /// [cancelText] 取消按钮文本 默认为取消
  /// [confirmCallback] 确认按钮回调
  /// [cancelCallback] 取消按钮回调
  /// [isDanger] 是否是危险操作 默认为 false
  /// [tag] 标签
  /// [T] 返回值类型
  static Future<T?> confirm<T>({
    required Widget Function(BuildContext context) builder,
    required FutureOr<T?> Function() confirmCallback,
    String? title,
    String? confirmText,
    String? cancelText,
    FutureOr<T?> Function()? cancelCallback,
    bool isDanger = false,
    String? tag,
  }) =>
      SmartDialog.show<T>(
        tag: tag,
        maskColor: _maskBackground,
        animationType: SmartAnimationType.centerFade_otherSlide,
        builder: (BuildContext context) => BaseConfirm(
          title: title,
          builder: builder,
          confirmText: confirmText,
          cancelText: cancelText,
          confirmHandle: () async {
            final T? result = await confirmCallback.call();
            await SmartDialog.dismiss<T>(
              result: result,
              tag: tag,
            );
          },
          cancelHandle: () async {
            final T? result = await cancelCallback?.call();
            await SmartDialog.dismiss<T>(
              result: result,
              tag: tag,
            );
          },
          isDanger: isDanger,
        ),
      );
}
