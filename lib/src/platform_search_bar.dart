/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:fluent_ui/fluent_ui.dart' show AutoSuggestBox;
import 'package:flutter/cupertino.dart'
    show
        CupertinoColors,
        CupertinoIcons,
        CupertinoSearchTextField,
        OverlayVisibilityMode;
import 'package:flutter/material.dart' show MaterialStateProperty, SearchBar;
import 'package:flutter/services.dart' show TextCapitalization, TextInputAction;
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

abstract class _BaseData {
  final Key? widgetKey;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool? autofocus;

  const _BaseData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.autofocus,
  });
}

class MaterialSearchBarData extends _BaseData {
  MaterialSearchBarData({
    // Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.autofocus,
    super.keyboardType,

    //Material
    this.leading,
    this.trailing,
    this.constraints,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.overlayColor,
    this.side,
    this.shape,
    this.padding,
    this.backgroundColor,
    this.hintStyle,
    this.textStyle,
    this.hintText,
    this.onSubmitted,
    this.textCapitalization,
    this.textInputAction,
  });

  // final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final BoxConstraints? constraints;
  final MaterialStateProperty<double?>? elevation;
  final MaterialStateProperty<Color?>? shadowColor;
  final MaterialStateProperty<Color?>? surfaceTintColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final MaterialStateProperty<BorderSide?>? side;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<TextStyle?>? hintStyle;
  final MaterialStateProperty<TextStyle?>? textStyle;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
}

class CupertinoSearchBarData extends _BaseData {
  CupertinoSearchBarData({
    //Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    super.autofocus,
    super.keyboardType,

    //Cupertino
    this.onSubmitted,
    this.decoration,
    this.borderRadius,
    this.itemColor = CupertinoColors.secondaryLabel,
    this.itemSize = 20.0,
    this.prefixInsets = const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
    this.prefixIcon = const Icon(CupertinoIcons.search),
    this.suffixInsets = const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
    this.suffixIcon = const Icon(CupertinoIcons.xmark_circle_fill),
    this.suffixMode = OverlayVisibilityMode.editing,
    this.onSuffixTap,
    this.restorationId,
    this.smartQuotesType,
    this.smartDashesType,
    this.enableIMEPersonalizedLearning,
    this.autocorrect,
    this.enabled,
    this.padding,
    this.backgroundColor,
    this.placeholderStyle,
    this.style,
    this.placeholder,
  })  : assert(
          !((decoration != null) && (backgroundColor != null)),
          'Cannot provide both a background color and a decoration\n'
          'To provide both, use "decoration: BoxDecoration(color: '
          'backgroundColor)"',
        ),
        assert(
          !((decoration != null) && (borderRadius != null)),
          'Cannot provide both a border radius and a decoration\n'
          'To provide both, use "decoration: BoxDecoration(borderRadius: '
          'borderRadius)"',
        );
  final ValueChanged<String>? onSubmitted;
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final Color itemColor;
  final double itemSize;
  final EdgeInsetsGeometry prefixInsets;
  final Widget prefixIcon;
  final EdgeInsetsGeometry suffixInsets;
  final Icon suffixIcon;
  final OverlayVisibilityMode suffixMode;
  final VoidCallback? onSuffixTap;
  final String? restorationId;

  final SmartQuotesType? smartQuotesType;
  final SmartDashesType? smartDashesType;
  final bool? enableIMEPersonalizedLearning;
  final bool? autocorrect;
  final bool? enabled;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final TextStyle? placeholderStyle;
  final TextStyle? style;
  final String? placeholder;
}

class FluentSearchBarData extends _BaseData {
  FluentSearchBarData({
    // Common
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.onTap,
    super.onChanged,
    //Material
    this.leading,
    this.trailing,
    this.constraints,
    this.hintText,
  });

  // final String? hintText;
  final Widget? leading;
  final Widget? trailing;
  final BoxConstraints? constraints;
  final String? hintText;
}

class PlatformSearchBar extends PlatformWidgetBase<
    SearchBar,
    CupertinoSearchTextField,
    AutoSuggestBox,
    CupertinoSearchTextField,
    SearchBar,
    SearchBar,
    SearchBar> {
  final Key? widgetKey;
  //Common
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final bool? autoFocus;

  //Mixed
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  //Platform
  final PlatformBuilder<MaterialSearchBarData>? material;
  final PlatformBuilder<CupertinoSearchBarData>? cupertino;
  final PlatformBuilder<FluentSearchBarData>? windows;
  final PlatformBuilder<CupertinoSearchBarData>? macos;
  final PlatformBuilder<MaterialSearchBarData>? linux;
  final PlatformBuilder<MaterialSearchBarData>? fuchsia;
  final PlatformBuilder<MaterialSearchBarData>? web;

  const PlatformSearchBar({
    //Common
    super.key,
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.backgroundColor,
    this.keyboardType,
    this.autoFocus,
    //Mixed
    this.hintText,
    this.hintStyle,
    this.textStyle,
    //Platform
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  });

  @override
  SearchBar createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));
    final backgroundColor = this.backgroundColor;
    final hintStyle = this.hintStyle;
    final textStyle = this.textStyle;
    return SearchBar(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      focusNode: data?.focusNode ?? focusNode,
      onTap: data?.onTap ?? onTap,
      onChanged: data?.onChanged ?? onChanged,

      backgroundColor: data?.backgroundColor ??
          (backgroundColor != null
              ? MaterialStateProperty.all<Color>(backgroundColor)
              : null),
      hintText: data?.hintText ?? hintText,
      hintStyle: data?.hintStyle ??
          (hintStyle != null
              ? MaterialStateProperty.all<TextStyle>(hintStyle)
              : null),
      textStyle: data?.textStyle ??
          (textStyle != null
              ? MaterialStateProperty.all<TextStyle>(textStyle)
              : null),
      autoFocus: data?.autofocus ?? autoFocus ?? false,
      keyboardType: data?.keyboardType ?? keyboardType,

      //Material only
      leading: data?.leading,
      trailing: data?.trailing,
      constraints: data?.constraints,
      elevation: data?.elevation,
      shadowColor: data?.shadowColor,
      surfaceTintColor: data?.surfaceTintColor,
      overlayColor: data?.overlayColor,
      side: data?.side,
      shape: data?.shape,
      padding: data?.padding,
      onSubmitted: data?.onSubmitted,
      textCapitalization: data?.textCapitalization,
      textInputAction: data?.textInputAction,
    );
  }

  @override
  CupertinoSearchTextField createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));
    return CupertinoSearchTextField(
      //Common
      key: data?.widgetKey ?? widgetKey,
      controller: data?.controller ?? controller,
      focusNode: data?.focusNode ?? focusNode,
      onTap: data?.onTap ?? onTap,
      onChanged: data?.onChanged ?? onChanged,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      padding:
          data?.padding ?? const EdgeInsetsDirectional.fromSTEB(5.5, 8, 5.5, 8),
      placeholder: data?.placeholder ?? hintText,
      placeholderStyle: data?.placeholderStyle ?? hintStyle,
      style: data?.style ?? textStyle,
      autofocus: data?.autofocus ?? autoFocus ?? false,
      keyboardType: data?.keyboardType ?? keyboardType ?? TextInputType.text,

      //Cupertino only
      onSubmitted: data?.onSubmitted,
      decoration: data?.decoration,
      borderRadius: data?.borderRadius,
      itemColor: data?.itemColor ?? CupertinoColors.secondaryLabel,
      itemSize: data?.itemSize ?? 20.0,
      prefixInsets: data?.prefixInsets ??
          const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 3),
      prefixIcon: data?.prefixIcon ?? const Icon(CupertinoIcons.search),
      suffixInsets: data?.suffixInsets ??
          const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 2),
      suffixIcon:
          data?.suffixIcon ?? const Icon(CupertinoIcons.xmark_circle_fill),
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.editing,
      onSuffixTap: data?.onSuffixTap,
      restorationId: data?.restorationId,
      smartQuotesType: data?.smartQuotesType,
      smartDashesType: data?.smartDashesType,
      enableIMEPersonalizedLearning:
          data?.enableIMEPersonalizedLearning ?? true,
      autocorrect: data?.autocorrect ?? true,
      enabled: data?.enabled,
    );
  }

  @override
  AutoSuggestBox createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));
    final onSearchChanged = data?.onChanged ?? onChanged;

    return AutoSuggestBox(
      key: data?.widgetKey ?? widgetKey,
      items: const [],
      controller: data?.controller ?? controller,
      leadingIcon: data?.leading,
      trailingIcon: data?.trailing,
      placeholder: data?.hintText ?? hintText,
      focusNode: data?.focusNode ?? focusNode,
      onChanged: onSearchChanged == null
          ? null
          : (text, reason) => onSearchChanged(text),
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoSearchTextField createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  SearchBar createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  SearchBar createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  SearchBar createWebWidget(BuildContext context) =>
      createMaterialWidget(context);
}
