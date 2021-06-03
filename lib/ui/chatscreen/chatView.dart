import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chatViewModel.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  color: Colors.transparent,
                  child: Image.asset('assets/chat.png'),
                ),
              ),
              // Container(
              //     child: Positioned(
              //         bottom: 150,
              //         child: Text(
              //           'No Messages',
              //           style: TextStyle(fontWeight: FontWeight.w500),
              //         )))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
