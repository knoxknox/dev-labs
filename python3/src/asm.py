import dis

# CPython bytecode disassembling
dis.dis('for i in range(1, 10): print(i)')

# 0           0 RESUME                   0
# 1           2 PUSH_NULL
#             4 LOAD_NAME                0 (range)
#             6 LOAD_CONST               0 (1)
#             8 LOAD_CONST               1 (10)
#            10 CALL                     2
#            18 GET_ITER
#       >>   20 FOR_ITER                10 (to 44)
#            24 STORE_NAME               1 (i)
#            26 PUSH_NULL
#            28 LOAD_NAME                2 (print)
#            30 LOAD_NAME                1 (i)
#            32 CALL                     1
#            40 POP_TOP
#            42 JUMP_BACKWARD           12 (to 20)
#       >>   44 END_FOR
#            46 RETURN_CONST             2 (None)
