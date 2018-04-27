#!/usr/bin/env ruby

def addArray(arr1, arr2)
  result = []
  tmp = 0
  s1 = arr1.size-1
  s2 = arr2.size-1
  for i in s1.downto(0) do
    for j in s2.downto(0) do
      sum = arr1[j] + arr2[j] + tmp
      if(sum > 9)
        tmp = sum/10
        result[j] = sum%10
      else
        tmp = 0
        result[j] = sum
      end
    end
  end
  if tmp != 0
    result = [tmp] + result
  end
  print "\n"
  return result
end

def addArrayString(str1, str2)
  arr1 = str1.to_i
  arr2 = str2.to_i
  result = []
  tmp = 0
  s1 = arr1.size-1
  s2 = arr2.size-1
  for i in s1.downto(0) do
    for j in s2.downto(0) do
      sum = arr1[j] + arr2[j] + tmp
      if(sum > 9)
        tmp = sum/10
        result[j] = sum%10
      else
        tmp = 0
        result[j] = sum
      end
    end
  end
  if tmp != 0
    result = [tmp] + result
  end
  print "\n"
  return result
end

data1 = [6,2,4]
data2 = [4,5,6]

data1s = "624"
data2s = "456"

print addArray(data1, data2)

print "\n"
