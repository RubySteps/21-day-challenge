def calculate(n1, n2, operation)
  n1, n2 = n1.to_i(2), n2.to_i(2)
  case operation
    when 'add'       then n1 + n2
    when 'subtract' then n1 - n2
    when 'multiply' then n1 * n2
    end.to_s(2)
end
