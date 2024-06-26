part of 'models.dart';

/// 阅读设置
@Freezed()
@collection
class BookReadSetting with _$BookReadSetting {
  const factory BookReadSetting({
    required int id,
    required DateTime updateTime,
    double? fontSize,
    double? fontHeight,
    double? wordSpacing,
    double? letterSpacing,
    String? fontFamily,
    required PageFlipType pageFlipType,
  }) = _BookReadSetting;

  const BookReadSetting._();
}

enum PageFlipType {
  /// 左右滑动
  slideLeftOrRight(0),

  /// 上下滑动
  slideUpAndDown(1),
  ;

  const PageFlipType(this.value);

  final short value;
}
