(import rvars :as rv)

(defn test [num-tests]
  (for i 0 num-tests
    (pp (rv/gen-rand-int 0 10))
    (pp (rv/gen-rand-double 0 10))
    (pp (rv/gen-rand-bool))
    (pp (rv/gen-rand-string 20))
    (pp (rv/gen-rand-buffer 20))
    (pp (rv/gen-rand-table 10))
    (pp (rv/gen-rand-struct 10))
    (pp (rv/gen-rand-tuple "int" 10))
    (pp (rv/gen-rand-tuple "double" 10))
    (pp (rv/gen-rand-tuple "string" 10))
    (pp (rv/gen-rand-tuple "buffer" 10))
    (pp (rv/gen-rand-tuple "array" 10))
    (pp (rv/gen-rand-tuple "tuple" 10))
    (pp (rv/gen-rand-tuple "table" 2))
    (pp (rv/gen-rand-tuple "struct" 2))))

(test 1000)
