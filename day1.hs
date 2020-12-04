import Data.List

readInput :: FilePath -> IO [Int]
readInput fileName = do
  content <- readFile fileName
  let integers = map read (lines content) :: [Int]
  pure integers

pairsOfSum :: [Int] -> Int -> Maybe (Int, Int)
pairsOfSum numbers desiredSum = pairsOfSum' numbers desiredSum 0 (length numbers - 1)

pairsOfSum' :: [Int] -> Int -> Int -> Int -> Maybe (Int, Int)
pairsOfSum' numbers desiredSum i j
  | i >= j = Nothing
  | otherwise = do
    let sum = numbers !! i + numbers !! j
    if sum == desiredSum
      then Just (i, j)
      else
        if sum > desiredSum
          then pairsOfSum' numbers desiredSum i (j - 1)
          else pairsOfSum' numbers desiredSum (i + 1) j

solvePart1 :: [Int] -> String
solvePart1 numbers = do
  case pairsOfSum numbers 2020 of
    Just (i, j) -> show (numbers !! i * numbers !! j)
    Nothing -> "Could not calculate the answer"

solvePart2 :: [Int] -> String
solvePart2 [] = "Could not calculate the answer"
solvePart2 (x : xs) = do
  case pairsOfSum xs (2020 - x) of
    Just (i, j) -> show (x * xs !! i * xs !! j)
    Nothing -> solvePart2 xs

main = do
  numbers <- readInput "day1.in"
  let sortedNumbers = sort numbers
  putStrLn ("Part 1 answer - " ++ solvePart1 sortedNumbers)
  putStrLn ("Part 2 answer - " ++ solvePart2 sortedNumbers)
