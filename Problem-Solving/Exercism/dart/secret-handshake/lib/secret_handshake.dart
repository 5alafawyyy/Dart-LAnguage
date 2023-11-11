class SecretHandshake {
  List<String> commands(int number) {
    String binaryRepresentation = number.toRadixString(2).padLeft(5, '0');
    List<String> result = [];

    for (int i = binaryRepresentation.length - 1; i >= 0; i--) {
      if (binaryRepresentation[i] == '1') {
        switch (i) {
          case 4:
            result.add("wink");
            break;
          case 3:
            result.add("double blink");
            break;
          case 2:
            result.add("close your eyes");
            break;
          case 1:
            result.add("jump");
            break;
          case 0:
            result = result.reversed.toList();
            break;
          default:
        }
      }
    }

    return result;
  }
}

/* =================== ANOTHER SOLUTION =================*/
// class SecretHandshake {
//   List<String> commands(int number) {
//     String binaryRepresentation = number.toRadixString(2).padLeft(5, '0');
//     List<String> result = [];

//     if (binaryRepresentation[binaryRepresentation.length - 1] == '1') {
//       result.add('wink');
//     }

//     if (binaryRepresentation[binaryRepresentation.length - 2] == '1') {
//       result.add('double blink');
//     }

//     if (binaryRepresentation[binaryRepresentation.length - 3] == '1') {
//       result.add('close your eyes');
//     }

//     if (binaryRepresentation[binaryRepresentation.length - 4] == '1') {
//       result.add('jump');
//     }

//     if (binaryRepresentation[binaryRepresentation.length - 5] == '1') {
//       result = result.reversed.toList();
//     }

//     return result;
//   }
// }
