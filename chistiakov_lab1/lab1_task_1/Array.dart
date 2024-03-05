import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');
}

List<int> generateRandomArray(int size) {
  Random random = Random();
  List<int> array = List.generate(size, (index) => random.nextInt(100));
  return array;
}
