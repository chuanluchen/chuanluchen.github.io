---
layout: project
title: '127-Word Ladder'
date: 01 July 2020

---
## 题意
> Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
> Only one letter can be changed at a time.
> Each transformed word must exist in the word list.
> Note:
> - Return 0 if there is no such transformation sequence.
> - All words have the same length.
> - All words contain only lowercase alphabetic characters.
> - You may assume no duplicates in the word list.
> - You may assume beginWord and endWord are non-empty and are not the same.

~~~python
Example 1:
Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.

Example 2:
Input:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]
Output: 0
Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
~~~

## 思路
- BFS 求最短路径
- queue实现：存入word, step; wordset相当于visited,使用后remove
- 遍历Word：每次更改一个字母，替换为26个字母中的一个 -> 如在wordset中，存入queue

~~~python
class Solution(object):
    def ladderLength(self, beginWord, endWord, wordList):
        """
        :type beginWord: str
        :type endWord: str
        :type wordList: List[str]
        :rtype: int
        """
        if not wordList or endWord not in wordList: return 0
        
        queue = []
        wordset= set(wordList)
        
        queue.append((beginWord,1))
        
        
        while queue:
            word,step = queue.pop(0)
            if word == endWord: return step
            
            l = len(beginWord)
            for i in range(l):
                for c in 'abcdefghijklmnopqrstuvwxyz':
                    newWord = word[:i] + c + word[i + 1:]
                    if newWord in wordset:
                        wordset.remove(newWord)
                        queue.append((newWord, step + 1))
                    
        return 0
~~~
