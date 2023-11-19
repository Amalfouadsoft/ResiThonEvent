import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/chat_messages_details_body.dart';

class SpeakerPublicChatView extends StatelessWidget {
  const SpeakerPublicChatView({Key? key, required this.groupImage, required this.groupName, required this.sessionId}) : super(key: key);
  final String groupImage;
  final String groupName;
  final int sessionId;
  // final int id;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios,
            size: MediaQuery.of(context).size.height*.016,
            color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor:Color(0x33DCDCDC),
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.035,
              width: MediaQuery.of(context).size.height*.035,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.0175,),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.0175,),
                  child:
                  Image.asset(
                    groupImage,
                    fit: BoxFit.cover,
                  ),
                    // CachedNetworkImage(
                  //   imageUrl: groupImage,
                  //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //       CircularProgressIndicator(value: downloadProgress.progress),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
              ),
            ),
            SizedBox(width: AppConstants.width10(context),),
            Text(groupName,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height*.018,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff323232)
              ),),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body:        ChatMessagesDetailsBody(
        chatType: 1,
        sessionId: sessionId,
      ),
    );
  }
}
