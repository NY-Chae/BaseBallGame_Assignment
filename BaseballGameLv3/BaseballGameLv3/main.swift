struct BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수 호출

        while true {
            print("세 자리 숫자를 입력하세요:", terminator: " ") // 유저에게 입력값을 받는 안내 메시지 출력

            guard let input = readLine() else { // 입력값이 nil인 경우 반복문 처음으로 돌아가기
                continue
            }

            guard let number = Int(input) else { // 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
                print("유효하지 않은 입력입니다.")
                continue
            }

            guard input.count == 3 else { // 세 자리가 아닌 경우 반복문 처음으로 돌아가기
                print("세 자리 숫자를 입력하세요.")
                continue
            }

            let digits = String(number).compactMap { Int(String($0)) } // 입력값을 각 자리 숫자로 분리하여 배열로 저장

            guard digits.count == 3, Set(digits).count == 3 else { // 숫자가 세 개가 아니거나, 중복된 숫자가 있는 경우 반복문 처음으로 돌아가기
                print("올바르지 않은 입력값입니다.")
                continue
            }

            var strike = 0
            var ball = 0

            for (index, digit) in digits.enumerated() { // 입력값과 정답을 비교하여 스트라이크와 볼 계산
                if digit == answer[index] {
                    strike += 1
                } else if answer.contains(digit) {
                    ball += 1
                }
            }

            if strike == 3 { // 정답일 경우 게임 종료
                print("정답입니다!")
                break
            } else {
                print("\(strike)스트라이크 \(ball)볼") // 스트라이크와 볼 출력
            }
        }
    }

    private func makeAnswer() -> [Int] {
        var digits = [Int]()

        while digits.count < 3 {
            let digit = Int.random(in: 1...9) // 1부터 9까지의 난수 생성
            if !digits.contains(digit) { // 중복된 숫자가 없을 때만 추가
                digits.append(digit)
            }
        }

        return digits
    }
}

let game = BaseballGame()
game.start()
