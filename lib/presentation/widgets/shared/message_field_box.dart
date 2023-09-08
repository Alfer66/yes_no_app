import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder:
          outlineInputBorder, //Se ponen igual para que no este cambiando de tamaño cuando lo pones en foco
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          // imprime el valor en el componente al momento de seleccionar el boton
          print('button: $textValue');
          textController.clear();
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // se escribe lo escrito en el textFormFiel al dar en submit o enviar
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
      //onChanged: (value) {
      //  // se imprime al escribir cada letra en el teclado
      //  print('changed: $value');
      //},
    );
  }
}
