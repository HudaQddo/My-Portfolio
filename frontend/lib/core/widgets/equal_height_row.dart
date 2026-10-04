import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Measures content at its actual column width before equalizing row heights.
class EqualHeightRow extends MultiChildRenderObjectWidget {
  const EqualHeightRow({
    required super.children,
    required this.spacing,
    this.columns,
    super.key,
  });
  final double spacing;
  final int? columns;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _EqualHeightRow(spacing, columns);

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderBox renderObject,
  ) {
    (renderObject as _EqualHeightRow)
      ..spacing = spacing
      ..columns = columns
      ..markNeedsLayout();
  }
}

class _EqualHeightRowParentData extends ContainerBoxParentData<RenderBox> {}

class _EqualHeightRow extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _EqualHeightRowParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _EqualHeightRowParentData> {
  _EqualHeightRow(this.spacing, this.columns);
  double spacing;
  int? columns;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _EqualHeightRowParentData) {
      child.parentData = _EqualHeightRowParentData();
    }
  }

  @override
  void performLayout() {
    final count = columns ?? childCount;
    if (count == 0) {
      size = constraints.constrain(Size.zero);
      return;
    }
    final width = math.max(
      0.0,
      (constraints.maxWidth - spacing * (count - 1)) / count,
    );
    var height = 0.0;
    var child = firstChild;
    while (child != null) {
      child.layout(BoxConstraints.tightFor(width: width), parentUsesSize: true);
      height = math.max(height, child.size.height);
      child = childAfter(child);
    }
    var x = 0.0;
    child = firstChild;
    while (child != null) {
      child.layout(
        BoxConstraints.tight(Size(width, height)),
        parentUsesSize: true,
      );
      (child.parentData! as _EqualHeightRowParentData).offset = Offset(x, 0);
      x += width + spacing;
      child = childAfter(child);
    }
    size = constraints.constrain(Size(constraints.maxWidth, height));
  }

  @override
  void paint(PaintingContext context, Offset offset) =>
      defaultPaint(context, offset);

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      defaultHitTestChildren(result, position: position);
}
