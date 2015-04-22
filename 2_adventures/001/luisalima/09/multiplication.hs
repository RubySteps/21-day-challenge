
--multiply x y = multiplyList (reverse.splitInDigits x) (reverse.splitInDigits y)

splitInDigits 0 = []
splitInDigits x = x `mod` 10 : splitInDigits (x `div` 10)

-- somehow I think I could use flip here instead to switch the number
-- of arguments to intermediateMult
multiplyList xs ys = foldr (\y acc -> intermediateMult y xs : acc) [] ys

-- now I'm missing a sumLists to sum all those intermediate results...

splitDiv x = ( x `mod` 10, x `div` 10)

-- multiply a number split up in its digits - represented by xs - by
-- a number y composed of a single digit
intermediateMult y xs = let (lst, last) = foldr (\x (acc, carry) -> let (res, newCarry) = splitDiv (x*y+carry) in (res: acc, newCarry)) ([], 0) xs in (last:lst)
