import Foundation

func makeAnswers() -> [Int] {
    var numbers = [Int]()
    
    while numbers.count < 3 {
        let randomNum = Int.random(in: 1...9)
        if !numbers.contains(randomNum) {
            numbers.append(randomNum)
        }
    }
    
    return numbers
}

func playGame() {
    let targetNumbers = makeAnswers()
    var attempts = 0
    
    print("1에서 9까지의 서로 다른 숫자 3개를 맞춰보세요!")
    
    while true {
        print("세 숫자를 입력하세요 (예: 1 2 3):")
        if let input = readLine() {
            let guessedNumbers = input.split(separator: " ").compactMap { Int($0) }
            
            if guessedNumbers.count == 3 {
                attempts += 1
                
                var correctCount = 0
                for (index, number) in guessedNumbers.enumerated() {
                    if targetNumbers.contains(number) {
                        if targetNumbers[index] == number {
                            correctCount += 1
                        }
                    }
                }
                
                if correctCount == 3 {
                    print("축하합니다! 세 숫자를 모두 맞추셨습니다.")
                    print("시도한 횟수: \(attempts)")
                    break
                } else {
                    print("맞은 숫자: \(correctCount)")
                }
            } else {
                print("잘못된 입력입니다. 세 숫자를 공백으로 구분하여 입력해주세요.")
            }
        }
    }
}

// 게임 실행
playGame()

