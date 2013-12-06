# Computes the Jaro-Winkler distance between 2 strings
String.prototype.distance = (reference) ->

  distance = (string1, string2) ->
    [string1, string2] = [string2, string1] if string1.length > string2.length

    matchWindow = ~~Math.max(0, string2.length / 2 - 1)
    string1Matches = []
    string2Matches = []

    for ch, i in string1
      windowStart = Math.max(0, i - matchWindow)
      windowEnd = Math.min(i + matchWindow + 1, string2.length)

      for j in [windowStart...windowEnd]
        if !string2Matches[j]? && ch == string2[j]
          string1Matches[i] = ch
          string2Matches[j] = string2[j]
          break

    string1Matches = string1Matches.join("")
    string2Matches = string2Matches.join("")

    numMatches = string1Matches.length

    return 0 if !numMatches

    # Count transpositions
    transpositions = 0
    (transpositions++ if ch != string2Matches[i]) for ch, i in string1Matches

    # Count prefix matches
    prefix = 0
    (if ch == string2[i] then prefix++ else break) for ch, i in string1

    jaro = ((numMatches / string1.length) + (numMatches / string2.length) +
        (numMatches - ~~(transpositions / 2)) / numMatches) / 3.0

    jaro + Math.min(prefix, 4) * 0.1 * (1 - jaro)

  distance(@, reference)
