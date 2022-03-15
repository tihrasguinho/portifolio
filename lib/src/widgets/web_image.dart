import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class WebImage extends StatefulWidget {
  const WebImage(
    this.data, {
    Key? key,
    this.viewType,
    this.alt,
    this.width,
    this.height,
    this.aspectRatio = 1 / 1,
  })  : isAsset = false,
        super(key: key);

  const WebImage.asset(
    this.data, {
    Key? key,
    this.viewType,
    this.alt,
    this.width,
    this.height,
    this.aspectRatio = 1 / 1,
  })  : isAsset = true,
        super(key: key);

  final String data;
  final String? viewType;
  final String? alt;

  final double? width;
  final double? height;

  final double aspectRatio;

  final bool isAsset;

  @override
  State<WebImage> createState() => _WebImageState();
}

class _WebImageState extends State<WebImage> {
  late String _viewType;

  @override
  void initState() {
    _viewType = widget.viewType ?? 'IMG-${DateTime.now().toIso8601String()}';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final html.Element image = html.ImageElement()
        ..src = widget.isAsset ? './assets/${widget.data}' : widget.data
        ..alt = widget.alt
        ..className = 'flutter-images'
        ..style.width = '100%'
        ..style.height = '100%';
      return image;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return widget.height != null || widget.width != null
    //     ? Center(
    //         child: SizedBox(
    //           width: widget.width,
    //           height: widget.height,
    //           child: HtmlElementView(viewType: _viewType),
    //         ),
    //       )
    //     : AspectRatio(
    //         aspectRatio: widget.aspectRatio,
    //         child: HtmlElementView(viewType: _viewType),
    //       );

    return Stack(
      children: [
        widget.isAsset
            ? Image.asset(
                widget.data,
                width: widget.width,
                height: widget.height,
              )
            : Image.network(
                widget.data,
                width: widget.width,
                height: widget.height,
              ),
        Positioned.fill(
          child: Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            maintainInteractivity: true,
            visible: false,
            child: HtmlElementView(
              viewType: _viewType,
            ),
          ),
        ),
      ],
    );
  }
}
