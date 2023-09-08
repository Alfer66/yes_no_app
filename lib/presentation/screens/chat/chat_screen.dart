import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://www.elmueble.com/medio/2023/04/14/gato-de-raza-ragdoll_5c5827ec_230414185205_1000x1493.jpg'),
          ),
        ),
        title: const Text('Mi mascota 🐈'),
        centerTitle: false,
      ),
      body: Center(
        child: _ChatView(),
     ),
   );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
                },
              ),
            ),
          
            /// Caja de text de mensaje
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}