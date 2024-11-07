//
//  GameLogic.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation

class GameLogic {
    
    let ui = UserInterface()
    let userInputData: UserInputData
    let randomLogic = RandomNumberLogic()
    let userData = UserInputData()
    let data : Data
    
    let saveRandomArray:[Int]
    
    init(data: Data, userInputData: UserInputData, randomArray: [Int]) {
            self.data = data
            self.userInputData = userInputData
            self.saveRandomArray = randomArray
        }
    func BaseBallGameLogic() {
        

        print(#function)
        
        repeat {
            //카운트 수가 누적되지 않게 반복문에 들어서면 카운트 초기화가 됩니다.
            var countStrike = 0
            var countBall = 0
            
            //유저의 인풋이 조건에 맞다면 true을 반환하고, 게임 시작.
            if userData.checkUserInput() == true {
                data.tryCountNum += 1
                //랜덤숫자의 인덱스와 요소를 튜플의 형태로 추출
                for (Index, Element) in randomLogic.randomArray.enumerated() {
                    
                    //유저배열의 인덱스 넘버를 기반으로 요소를 추출
                    //랜덤숫자의 요소와 동일하다면 스트라이크 카운트 1증가
                    if userData.userNumberArray[Index] == Element  {
                        countStrike += 1
                    }else if userData.userNumberArray.contains(Element) {
                        countBall += 1
                    }
                }
                
                if countStrike != 0 || countBall != 0 {
                    print("\(countStrike)스트라이크")
                    print("\(countBall)볼")
                }
                
                if countStrike == 0 && countBall == 0 {
                    print("Nothing")
                }else if countStrike == 3 {

                    data.saveRecord()
                    data.tryCountNum = 0
                    ui.printCorrect()
                    ui.printMenu()
                    userData.inputMenuNumber()
                }
            }else {
                // 조건 이외의 입력값이 입력되면 에러메세지 출력
                ui.printErrorUserIn()
            }
        }while (true)
    }
    
    
}