// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

//MARK: - 1. Two Sum (#1)

//public func twoSum (nums: [Int], target: Int) -> Bool {
//     var seenSet : Set<Int> = []
//    for num in nums {
//        let diff = target - num
//        if seenSet.contains(diff) {
//            return true
//        } else {
//            seenSet.insert(num)
//        }
//    }
//    return false
//}

func twoSumm(_ nums: [Int], _ target: Int) -> [Int] {
       let sortedNums = nums.enumerated().sorted {$0.element < $1.element}
        var left = 0
        var right = sortedNums.count - 1

        while left < right {
            var sum = sortedNums[left].element + sortedNums[right].element
            if sum == target{
                 return [sortedNums[left].offset, sortedNums[right].offset]
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    } // nlogn

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var dict = [Int: Int]()
       for (index, value) in nums.enumerated() {
            let compliment = target - value
            if let complimentIndex = dict[compliment]{
                return [complimentIndex, index]
            }
            dict[value] = index
       }
       return []
    } // n

//MARK: - 2. Max Profit (#121)

func maxProfit(_ prices: [Int]) -> Int {
    var start = 0
    var end = 1
    var maxProfit = 0
    
    while end <= prices.count - 1 {
        var startP = prices[start]
        var endP = prices[end]
        var profit = endP - startP
        if startP > endP {
            start += 1
        } else {
            maxProfit = max(maxProfit, profit)
            end += 1
        }
    }
    return maxProfit
}

//MARK: - 3. Contains Duplicate (#217)

func containsDuplicate(_ nums: [Int]) -> Bool {
    let numsSet = Set(nums)
    if nums.count == numsSet.count {
        return false
    }
    return true
}

//MARK: - 4. Product of Array Except Self (#238)

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = Array(repeating: 1, count: n)
    
    // prefix stores the multiply of itself and the number before that ( but we save it after wards)
    // result[i] = prefix -- taki ek step jyada lge --- cz humme usee phle ka store krna hei multiple taki wo khud na aaye
    var prefix = 1
    for i in 0..<n {
        result[i] = prefix
        prefix *= nums[i]
    } // result [1,1,2,6]
    
    // suffix stores the multiple of itself and the number on the right(cz array is rev) (but we save it after one step so it doesnt include itself)
    // result[i] *= suffix -- same as above but also multiplies the prev array to itself so to avoid 1 extra loop
    var suffix = 1
    for i in (0..<n).reversed() {
        result[i] *= suffix
        suffix *= nums[i]
    }
    return result
}

//MARK: - 5. Maximum Subarray (#53)

func maxSubArray(_ nums: [Int]) -> Int {
    var maxSubArraySum = nums[0]
    var currentSubArraySum = nums[0]
    
    for i in (1..<nums.count){
        currentSubArraySum = max(nums[i], nums[i] + currentSubArraySum)
        maxSubArraySum = max(currentSubArraySum, maxSubArraySum)
    }
    return maxSubArraySum
}

//MARK: - 6. Maximum Product Subarray (#152)

    func maxProduct(_ nums: [Int]) -> Int {
        
        return 0
    }

//MARK: - 7. Valid Anagram (#242)

func isAnagramm(_ s: String, _ t: String) -> Bool {
        if String(s.sorted()) == String(t.sorted()){
            return true
        } else {
            return false
        }
    } // nlogn

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {return false}
    var charCount = [Character: Int]()
    for char in s {
        charCount[char, default : 0] += 1
    }
    for char in t {
        charCount[char, default : 0] -= 1
        if charCount[char]! < 0 { return false}
    }
    return true
} // n




//MARK: - 8. Group Anagrams (#49)

func groupAnagramss(_ strs: [String]) -> [[String]] {
    var dict = [String : [String]]()
    for word in strs {
        let sortedWord = String(word.sorted())
        dict[sortedWord, default: [] ].append(word)
    }
    return Array(dict.values)
} // m * n logn

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [Array<Int> : [String]]()
    for word in strs {
        var arrayInt = [Int](repeating : 0, count : 26)
        for letter in word {
            arrayInt[Int(letter.asciiValue! - 97)] += 1
        }
        dict[arrayInt, default : [] ].append(word)
    }
    return Array(dict.values)
} // m * n

//MARK: - 9. Top K Frequent Elements (#347)

func topKFrequentt(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = [Int : Int]()
    for int in nums {
        dict[int, default : 0] += 1
    }
    let topKeys = dict
        .sorted { $0.value > $1.value }
        .prefix(k)
        .map{ $0.key }
    
    return topKeys
} // n logn

// this can be done n logk but i dont know heap (k can be smaller than n but is n in worst case)

