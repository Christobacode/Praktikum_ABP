void main() {
  List<int> newList = List.filled(3, 0);

  newList[0] = 12;
  newList[1] = 13;
  newList[2] = 11;

  print("Fixed List: $newList");

  List<int> dynamicList = [];

  dynamicList.add(12);
  dynamicList.add(13);
  dynamicList.add(11);

  print("Dynamic List: $dynamicList");
}