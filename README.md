jaro-winkler-js
===============

An implementation of the Jaro-Winkler distance algorithm (a measure of string similarity) in CoffeeScript (minified js also provided).

Usage
-----

A `distance` method is added to the String prototype (yeah yeah).

Example:

```javascript
"b".distance("brian zhou")  // 0.73
"b".distance("bo chen")     // 0.74

"br".distance("brian zhou") // 0.79
"br".distance("bo chen")    // 0.59
```
