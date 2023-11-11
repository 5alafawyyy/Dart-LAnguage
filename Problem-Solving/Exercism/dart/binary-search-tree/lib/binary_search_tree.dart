class Node {
  String data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  late Node root ;

  BinarySearchTree(String data) {
    root = Node(data);
  }

  void insert(String data) {
    root = _insertRec(root, data)!;
  }

  Node? _insertRec(Node? root, String data) {
    if (root == null) {
      return Node(data);
    }

    if (data.compareTo(root.data) < 0) {
      root.left = _insertRec(root.left, data);
    } else if (data.compareTo(root.data) > 0) {
      root.right = _insertRec(root.right, data);
    }

    return root;
  }

  List<String> get sortedData {
    List<String> result = [];
    _inOrderTraversal(root, result);
    return result;
  }

  void _inOrderTraversal(Node? root, List<String> result) {
    if (root != null) {
      _inOrderTraversal(root.left, result);
      result.add(root.data);
      _inOrderTraversal(root.right, result);
    }
  }
}
