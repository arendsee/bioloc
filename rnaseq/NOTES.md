1. I need proper currying. The phrase `map . &(foo . $1) data`, with currying
   simplifies to `map foo . data`. Lambda functions are, of course, still
   useful, but needn't be used for trivial cases. Well, these are two separate
   things. Currying gives me `map &(foo . $1) . data`, `map foo . data`
   additionally requires recognizing `foo` as a passed function, not an
   independent input to whatever is on the left. This requires giving up
   multiple composition. I should probably transition to the tried-and-true
   syntax of Haskell. With '$' and '.' and ' ' for function calling.

2. how to deal with highly polymorphic and parameter-shifting standalones?

3. how to deal with outputs of folders with files? they are basically
   structures ...

4. I don't like the pull-based handling. What I really need is conventional
   push-based syntax with lazy evaluation. If I go to push-based syntax, probes
   would always be evaluated if their parent is evaluated.

5. should I use absolute paths or relative paths?
