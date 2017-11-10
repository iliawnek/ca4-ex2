module Main where
import M1run

main :: IO ()
main = run_Sigma16_program multiplytest 10000

-----------------------------------------------------------------------

multiplytest :: [String]
multiplytest =
-- Machine Language  Addr    Assembly Language     Comment
-- ~~~~~~~~~~~~~~~~  ~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 [
  "f100", "0001", -- 0000 lea   R1,1[R0]     ; R1 = constant 1
  "f200", "0002", -- 0002 lea   R2,2[R0]     ; R2 = constant 2
  "f300", "0003", -- 0004 lea   R3,3[R0]     ; R3 = constant 3
  "f400", "0015", -- 0006 lea   R4,21[R0]    ; R4 = constant 21
  "f500", "0028", -- 0008 lea   R5,40[R0]    ; R5 = constant 40

  "2612",         -- 000a mul   R6,R1,R2     ; R6 = R1 * R2
  "f602", "0017", -- 000b store R6,$0016[R0] ; $0017 := R6
  "2723",         -- 000d mul   R6,R2,R3     ; R6 = R2 * R3
  "f602", "0018", -- 000e store R6,$0017[R0] ; $0018 := R6
  "2834",         -- 0010 mul   R6,R3,R4     ; R6 = R3 * R4
  "f602", "0019", -- 0011 store R6,$0018[R0] ; $0019 := R6
  "2945",         -- 0013 mul   R6,R4,R5     ; R6 = R4 * R5
  "f602", "001a", -- 0014 store R6,$0019[R0] ; $001a := R6

  "d000",         -- 0016 trap  R0,R0,R0     ; terminate

  "0000",         -- 0017 data  1 * 2 = 2
  "0000",         -- 0018 data  2 * 3 = 6
  "0000",         -- 0019 data  3 * 21 = 63
  "0000"          -- 001a data  21 * 40 = 840
 ]

-----------------------------------------------------------------------
