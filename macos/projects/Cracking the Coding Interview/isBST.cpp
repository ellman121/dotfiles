/* Hidden stub code will pass a root argument to the function below. Complete the function to solve the challenge. Hint: you may want to write one or more helper functions.  

The Node struct is defined as follows:
   struct Node {
      int data;
      Node* left;
      Node* right;
   }
*/

void fillVectorInorder(vector<int> &vec, Node *root) {
    if(root == nullptr) {
        return;
    }
    
    // Process tree in order: left, self, right
    fillVectorInorder(vec, root->left);
    vec.push_back(root->data);
    fillVectorInorder(vec, root->right);
}

bool checkBST(Node *root) {
    vector<int> vec;
    fillVectorInorder(vec, root);
    
    // If the vector is sorted, we have a BST
    for(int i = 0; i < vec.size() - 1; ++i) {
        if(vec[i] >= vec[i+1]) {
            return false;
        }
    }
    
    return true;
}
