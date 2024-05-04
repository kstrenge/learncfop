class Move {
  final List<int> iconConfiguration;
  final String solveString;

  Move({required this.iconConfiguration, required this.solveString});
}

final Move oll2look01 = Move(iconConfiguration: [2, 9, 11, 13, 20], solveString: "OLL 2Look 2 + OLL 2Look 3");
final Move oll2look02 = Move(iconConfiguration: [2, 10, 11, 12, 20], solveString: "F R U R' U' F'");
final Move oll2look03 = Move(iconConfiguration: [2, 9, 11, 12, 16], solveString: "Fw R U R' U' Fw'");

final Move oll04 = Move(iconConfiguration: [5, 6, 7, 10, 11, 12, 16, 19, 21], solveString: "(R'2 D) (R' U2) (R D') (R' U2 R')");
final Move oll05 = Move(iconConfiguration: [1, 6, 7, 10, 11, 12, 16, 17, 19], solveString: "(Rw U R' U') (L' U R U')");
final Move oll06 = Move(iconConfiguration: [4, 6, 7, 10, 11, 12, 15, 16, 21], solveString: "F' (Rw U R' U') (L' U R)");
final Move oll07 = Move(iconConfiguration: [1, 6, 8, 10, 11, 12, 15, 16, 21], solveString: "(R U R' U) (R U'2 R')");
final Move oll08 = Move(iconConfiguration: [3, 4, 6, 10, 11, 12, 16, 17, 19], solveString: "(L' U' L U') (L' U2 L)");
final Move oll09 = Move(iconConfiguration: [3, 4, 6, 10, 11, 12, 14, 16, 21], solveString: "(Fw R U R' U' Fw') (F R U R' U' F')");
final Move oll10 = Move(iconConfiguration: [1, 3, 6, 10, 11, 12, 16, 19, 21], solveString: "F (R U R' U') (R U R' U') (R U R' U') F'");
