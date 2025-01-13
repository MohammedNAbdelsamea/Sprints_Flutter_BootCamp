import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// A widget to display a banner indicating if the data is loaded from cache or network
class CacheInfoBanner extends StatelessWidget {
  final bool isFromCache;

  // Constructor to initialize the banner with the cache status
  const CacheInfoBanner({Key? key, required this.isFromCache}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: REdgeInsets.all(8),
      color: isFromCache ? Colors.green.shade100 : Colors.blue.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon indicating the source of the data
          Icon(
            isFromCache ? Icons.storage : Icons.cloud_download,
            size: 16.sp,
          ),
          SizedBox(width: 8.w),
          // Text indicating whether the data is from cache or network
          Text(
            isFromCache
                ? 'Data loaded from cache'
                : 'Data loaded from network',
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
