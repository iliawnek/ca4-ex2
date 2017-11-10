module Main where
import M1run

main :: IO ()
main = run_Sigma16_program arraysum 10000

arraysum :: [String]
arraysum =
  [
     "f100", "0001",  -- 0000 lea R1,1[R0] ; R1 = constant 1
     "f201", "0012",  -- 0002 load R2,n[R0] ; R2 = n
     "0300",          -- 0004 add R3,R0,R0 ; R3 = i = 0
     "0400",          -- 0005 add R4,R0,R0 ; R4 = sum = 0
                      -- loop
     "4532",          -- 0006 cmplt R5,R3,R2 ; R5 = (i<n)
     "f504", "000f",  -- 0007 jumpf R5,done[R0] ; if i>=n then goto done
     "f531", "0014",  -- 0009 load R5,x[R3] ; R5 = x[i]
     "0445",          -- 000b add R4,R4,R5 ; sum := sum + x[i]
     "0331",          -- 000c add R3,R3,R1 ; i = i + 1

     "f004", "0006", -- 000d jumpf R0, loop[R0] ; goto loop

     "f402", "0013", -- 000f done store R4, sum[R0] ; sum := R4

     "d000",         -- 0011 trap R0,R0,R0 ; terminate

     "0006", -- 0012 n data 6
     "0000", -- 0013 sum data 0
     "0012", -- 0014 x data 18
     "0021", -- 0015 data 33
     "0015", -- 0016 data 21
     "fffe", -- 0017 data -2
     "0028", -- 0018 data 40
     "0019" -- 0019 data 25
  ]
