import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/models/chat.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/default_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigatorBar(),
        appBar: CustomAppBar(
          onLeadingPressed: () => Navigator.pop(context),
          height: 65,
          iconRight: const [],
          title: 'Assistant',
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 93,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const ClipOval(
                        child: Material(
                          color: AppColors.white,
                          child: SizedBox(
                            height: 10,
                            width: 10,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: AppColors.salmon,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const DefaultInput(
                    height: 26,
                    width: 223,
                    textColor: AppColors.darkLetter,
                    hintText: 'Write Here...',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const ClipOval(
                    child: Material(
                      color: AppColors.white,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.mic,
                          size: 20,
                          color: AppColors.salmon,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const ClipOval(
                    child: Material(
                      color: AppColors.white,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.send,
                          size: 20,
                          color: AppColors.salmon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? AppColors.salmon
                          : AppColors.beige),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
        ]));
  }
}
