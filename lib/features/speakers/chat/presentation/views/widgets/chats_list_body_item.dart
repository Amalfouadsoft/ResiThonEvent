import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class ChatsListBodyItem extends StatelessWidget {
  const ChatsListBodyItem({Key? key, required this.name, required this.image, required this.id, required this.lastMessageFromFirebase, required this.lastMessageNumberFromFirebase,}) : super(key: key);
  final String name;
  final String image;
  final String? lastMessageFromFirebase;
  final String? lastMessageNumberFromFirebase;

  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.height5(context)),
      height: AppConstants.height55(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.06,
            width: MediaQuery.of(context).size.height*.06,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(.2),
              borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.06,),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.06,),
                child: CachedNetworkImage(
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),),
          ),
          SizedBox(
            width: AppConstants.width10(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.sp14(context),
                ),
              ),
              SizedBox(height: AppConstants.height10(context),),
              Text(
                lastMessageFromFirebase.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.sp10(context),
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // Text(
              //   "time",
              //   style: TextStyle(
              //     fontWeight: FontWeight.w400,
              //     fontSize: AppConstants.sp10(context),
              //     color: AppColors.greyColor,
              //   ),
              // ),
              SizedBox(height: AppConstants.height10(context),),
              if(lastMessageNumberFromFirebase!="0")
              Container(
                height: MediaQuery.of(context).size.height*.025,
                width: MediaQuery.of(context).size.height*.025,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.025,),
                ),
                child: Center(
                  child: Text(
                    "$lastMessageNumberFromFirebase",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstants.sp10(context),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
