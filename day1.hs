import Data.List

fib :: (Eq a, Num a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib n = fib (n -1) + fib (n -2)

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = do
  let doubleX = doubleMe x
  let doubleY = doubleMe y
  doubleX + doubleY

readInput :: FilePath -> IO [Int]
readInput fileName = do
  content <- readFile fileName
  let integers = map read (lines content) :: [Int]
  pure integers

solve :: [Int] -> Int -> Int -> Int
solve numbers i j = do
  let sorted = sort numbers
      iNum = sorted !! i
      jNum = sorted !! j
      sum = iNum + jNum
  if sum == 2020 then iNum * jNum else if sum > 2020 then solve numbers i (j -1) else solve numbers (i + 1) j

main = do
  numbers <- readInput "day1.in"
  let answer = solve numbers 0 (length numbers - 1)
  putStrLn ("Answer is " ++ show answer)
