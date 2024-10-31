import 'package:furniture_app/models/wishlist.dart';

class DreamBoard {
  final Wishlist? wishlist;
  static List<DreamBoard> dreamBoards = [];

  DreamBoard({
    this.wishlist,
  });

  void addDreamBoard(Wishlist? wishlist) {
    dreamBoards.add(DreamBoard(wishlist: wishlist));
  }

  void updateDreamBoard(String boardTitle, Wishlist wishlist) {
    for (var i in dreamBoards) {
      if (i.wishlist!.boardTitle == boardTitle) {
        
      }
    }
  }
}
