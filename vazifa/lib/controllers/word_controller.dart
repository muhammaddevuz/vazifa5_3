import 'dart:math';

import 'package:get/get.dart';

class WordController extends GetxController {
  RxList wordList = [
    ['l', 'i', 'm', 'o', 'n'],
    ['k', 'i', 'v', 'i'],
    ['o', 'l', 'm', 'a'],
    ['b', 'a', 'n', 'a', 'n'],
    ['g', 'i', 'l', 'o', 's'],
    ['x', 'u', 'r', 'm', 'o'],
    ['q', 'a', 'r', 'a', 'g', 'a', 't'],
    ['a', 'n', 'j', 'i', 'r'],
    ['u', 'z', 'u', 'm'],
    ['q', 'o', 'v', 'u', 'n'],
  ].obs;

  RxList questions = [
    "Qaysi sariq tsitrus mevasi o'zining nordon ta'mi bilan mashhur bo'lib, ko'pincha limonad tayyorlash uchun ishlatiladi?"
    "Qaysi kichik, jigarrang, tukli meva yorqin yashil go'sht va mayda qora urug'larga ega?",
    "Qaysi meva har kuni yeyilsa shifokorni uzoqroqda saqlaydi?",
    "Qaysi meva uzun, sariq va ko'pincha maymunlar bilan bog'liq bo'ladi?",
    "Qaysi kichik, qizil meva ko'pincha desertlar va kokteyllar uchun ishlatiladi?",
    "Palma daraxtida o'sadigan va ko'pincha quritilgan holda atiştirmalik sifatida yeyiladigan shirin meva nima?",
    "Qaysi quyuq binafsha rangli berry ko'pincha siroplar va qo'shimchalar tarkibida bo'ladi va immunitetni kuchaytirish uchun ishlatiladi?",
    "Qaysi kichik, shirin meva ichida mayda urug'lar bilan noyob tuzilishga ega va ko'pincha pechenye uchun ishlatiladi?",
    "Qaysi meva klasterlarda bo'ladi, qizil, yashil yoki binafsha rangga ega bo'lib, vino tayyorlash uchun ishlatiladi?",
    "Yashil go'shti bo'lgan qaysi qovun ko'pincha meva salatida beriladi?",
  ].obs;

  RxList answer = [].obs;
  RxList letters = [].obs;
  RxBool checkWin = false.obs;
  RxInt curIndex = 0.obs;
  RxInt point = 0.obs;

  get currentIndex => curIndex;

  void makeEmptyList() {
    for (var i = 0; i < wordList[curIndex.toInt()].length; i++) {
      answer.add(" ");
    }
    letters = [...wordList[curIndex.toInt()]].obs;
    for (var i = letters.length; i < 16; i++) {
      letters.add(String.fromCharCode(Random().nextInt(26) + 65).toLowerCase());
    }
    letters.shuffle();
    print(answer);
    print(letters);
  }

  void clearAnswer() {
    answer = [].obs;
  }

  void cancelAnswerLetter(int index) {
    letters[letters.indexOf(" ")] = answer[index];
    answer[index] = " ";
  }

  void changeLetter(int index) {
    String letter = letters[index];
    if (answer.contains(" ")) {
      letters[index] = " ";
    }
    for (var i = 0; i < answer.length; i++) {
      if (answer[i] == " ") {
        answer[i] = letter;
        break;
      }
    }

    checkWord();
  }

  void checkWord() {
    if (wordList[curIndex.toInt()].join() == answer.join()) {
      checkWin = true.obs;
    } else {
      checkWin = false.obs;
    }
  }

  void next() {
    if (curIndex.toInt() != wordList.length - 1) {
      if (answer.join() == wordList[curIndex.toInt()].join()) {
        print('aondjnfljanaddfwf');
        point += 10;
      }
      curIndex += 1;
      answer.clear();
      letters.clear();
      makeEmptyList();
      checkWord();
    } else {
      curIndex = 0.obs;
      answer.clear();
      letters.clear();
      makeEmptyList();
      checkWord();
      point = 0.obs;
    }
  }
}
