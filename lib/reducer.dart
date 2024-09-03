import 'actions.dart';
import 'state.dart';




AppState appReducer(AppState state, dynamic action) {
  if (action is CalculateSquarePerimeter) {
    final perimeter = 4 * action.sisi;
    return AppState(perimeter: perimeter);
  } else if (action is CalculateRectanglePerimeter) {
    final perimeter = 2 * (action.panjang + action.Lebar);
    return AppState(perimeter: perimeter);
  } else if (action is CalculateTrianglePerimeter) {
    final perimeter = action.sisi1 + action.sisi2 + action.sisi3;
    return AppState(perimeter: perimeter);
  }
  return state;
}

