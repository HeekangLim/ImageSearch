import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? minWidth;
  final double? minHeight;
  final BoxFit? fit;
  final Widget? errorView;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  // final VoidCallback? onSuccess;
  final VoidCallback? onImgDownloadStart;

  static const double DEFAULT_SCALE = 1.0;

  const ImageWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.fit,
    this.errorView,
    this.margin,
    this.padding,
    this.borderRadius,
    // this.onSuccess,
    this.onImgDownloadStart,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child:
      FutureBuilder(
        future : getUrl(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          String imageUrl = snapshot.data?? url;

          // Log.D('image progress third geturl');

          if (onImgDownloadStart != null){
            onImgDownloadStart!();
          }

          bool correctUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

          return
            Container(
              // color: Colors.red,
              margin: margin,
              padding: padding,
              width: width,
              height: height,
              constraints: BoxConstraints(
                minWidth: minWidth ?? 0,
                minHeight: minHeight ?? 0,
              ),
              child: ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                child: Stack(
                  children: [
                    Visibility(
                      visible: !correctUrl && imageUrl.isNotEmpty,
                      child: Container (
                        width: width,
                        height: height,
                        alignment: Alignment.center,
                        child:
                        const CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: correctUrl,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        errorWidget: (context, imageUrl, error) => errorView ?? Container(
                          width: width,
                          height: height,
                          color: Colors.white,
                        ),
                        progressIndicatorBuilder: (context, imageUrl, downloadProgress) {

                          return Container (
                            alignment: Alignment.center,
                            child:
                            const CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        },
                        fit: fit?? BoxFit.cover,
                        width: width,
                        height: height,

                      ),
                    ),
                  ],
                ),
              ),
            );
          // return Image.network(
          //   snapshot.data ?? url,
          //   key: key,
          //   fit: fit?? BoxFit.cover,
          //   width: width,
          //   height: height,
          //   scale: scale?? DEFAULT_SCALE,
          //   errorBuilder: (context, error, stackTrace) {
          //     return errorView ?? Container(
          //       width: width?? Dimens.wh_icon_big,
          //       height: height?? Dimens.wh_icon_big,
          //       color: Colors.white,
          //
          //     );
          //   },
          // );
       }
      ),
    );
  }

  /**
   * URL 처리가 필요한 경우
   */
  Future<String> getUrl() async {
    // Log.D('image progress first geturl');
    return url;
  }
}