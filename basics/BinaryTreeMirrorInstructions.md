In a programming language of choice, define a function to check if a binary
tree is a mirror image. For statically typed languages, you can assume that
node values are all integers.

A binary tree is a mirror image of itself if its left and right subtrees are
identical mirror images i.e., the binary tree is symmetrical.
This is best explained with a few examples.

  1
 / \
2   2
TRUE

   1
  / \
 2   2
  \
   3
FALSE

     1
   /   \
  2     2
 / \   / \
4   3 3   4
TRUE

       1
     /   \
    2     2
   / \   / \
  3   4 3   4
FALSE

       1
     /   \
    2     2
   /       \
  3         3
TRUE
