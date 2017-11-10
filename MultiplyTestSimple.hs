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
  "f100", "0002", -- 0000 lea   R1,2[R0]     ; R1 = constant 2
  "f200", "0003", -- 0002 lea   R2,3[R0]     ; R2 = constant 3

  "2312",         -- 0004 mul   R3,R1,R2     ; R3 = R1 * R2

  "d000"         -- 0005 trap  R0,R0,R0     ; terminate
 ]

-----------------------------------------------------------------------
