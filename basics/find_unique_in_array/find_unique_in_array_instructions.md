Write a function:
def solution(a)
that, given a non-empty zero-indexed array A of N integers, returns the first unique number in A. In other words, find the unique number with the lowest position in A. The function should return −1 if there are no unique numbers in A.
For example, given:
  A[0] = 1
  A[1] = 4
  A[2] = 3
  A[3] = 3
  A[4] = 1
  A[5] = 2
the function should return 4.
Given array A such that:
  A[0] = 6
  A[1] = 4
  A[2] = 4
  A[3] = 6
the function should return −1.
Assume that:
N is an integer within the range [1..100,000];
each element of array A is an integer within the range [0..1,000,000,000].
