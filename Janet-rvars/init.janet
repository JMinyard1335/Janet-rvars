# This module is to be used to generate random variables to be used in testing validation of input.
# This is nothing perfect or that complicated. The goal was to give my self a way to test random inputs to makesure
# that the functions I write are robust and can handle a variety of inputs.

(def- seed (math/rng (math/floor (os/clock))))

(defn gen-rand-bool []
  "Generate a random boolean"
  (if (= (math/rng-int seed 2) 1) true false))

(defn gen-rand-int [low high]
  "Generate a random Janet Number but rounded to the nearest whole number between low and high inclusive"
  (+ low (math/rng-int seed (- high low))))

(defn gen-rand-double [low high]
  "Generate a random Janet Number between low and high inclusive"
  (def rand-dec (math/random))
  (+ low (* rand-dec (- high low))))

(defn gen-rand-string [len]
  "Generate a random Janet String of length len"
  (var s "")
  (for i 0 len
    (def c (gen-rand-int 97 122))
    (set s (string/join (tuple s (string/from-bytes c)))))
  s)

(defn gen-rand-buffer [len]
  "Generate a random Janet Buffer of length len"
  (var b @"")
  (for i 0 len
    (def c (gen-rand-string 1))
    (buffer/push b c))
  b)

(defn gen-rand-table [size]
  "Generate a random table of size size the table is filled with random keys and values
   Where the keys are random strings and the values are random ints"
  (var t (table/new size))
  (for i 0 size
    (def key (gen-rand-string 5))
    (def val (gen-rand-int 0 10))
    (put t key val))
  t)

(defn gen-rand-struct [size]
  "Generates a random struct of size size the struct is filled with random keys and values
   Where the keys are random strings and the values are random ints"
  (var s (table/to-struct (gen-rand-table size))))

(defn gen-rand-tuple [t size]
  "Generates a random tuple of type t of size size"
  (var result [])
  (cond
    (= (string t) "int") (for i 0 size
                           (when (= 0 i)
                             (set result (tuple (gen-rand-int 0 10))))
                           (set result (tuple/join result (tuple (gen-rand-int 0 10)))))

    (= (string t) "double") (for i 0 size
                              (when (= 0 i)
                                (set result (tuple (gen-rand-double 0 10))))
                              (set result (tuple/join result (tuple (gen-rand-double 0 10)))))

    (= (string t) "string") (for i 0 size
                              (when (= 0 i)
                                (set result (tuple (gen-rand-string 10))))
                              (set result (tuple/join result (tuple (gen-rand-string 10)))))

    (= (string t) "buffer") (for i 0 size
                              (when (= 0 i)
                                (set result (tuple (gen-rand-buffer 10))))
                              (set result (tuple/join result (tuple (gen-rand-buffer 10)))))

    (= (string t) "array") (for i 0 size
                             (var a @[])
                             (for j 0 3
                               (array/push a (gen-rand-int 0 10)))
                             (when (= 0 i)
                               (set result (tuple a)))
                             (set result (tuple/join result (tuple a))))

    # This is not working as intended the tuple join is flattening the tuple and i need a tuple of tuples
    (= (string t) "tuple") (for i 0 size
                             (var tup ())
                             (for j 0 3
                               (set tup (tuple/join tup (tuple (gen-rand-int 0 10)))))
                             (set result (tuple/join result tup)))

    (= (string t) "table") (for i 0 size
                             (when (= 0 i)
                               (set result (tuple (gen-rand-table 3))))
                             (set result (tuple/join result (tuple (gen-rand-table 3)))))

    (= (string t) "struct") (for i 0 size
                              (when (= 0 i)
                                (set result (tuple (gen-rand-struct 3))))
                              (set result (tuple/join result (tuple (gen-rand-struct 3)))))) result)

(defn gen-rand-array [t size]
  "Generates a random array of type t of size size"
  (cond
    (= t :int) ()
    (= t :double) ()
    (= t :bool) ()
    (= t :string) ()
    (= t :buffer) ()
    (= t :array) ()
    (= t :tuple) ()
    (= t :table) ()
    (= t :struct) ()))
