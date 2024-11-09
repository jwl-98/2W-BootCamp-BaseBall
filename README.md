# 내배캠 문법 심화 과제 - 숫자 야구 게임 만들기
2024.11.04 ~ 2024.11.09
**XCode의 Command Line 툴을 이용해 제작했습니다..**

숫자 야구 게임은 **두 명**이 즐길 수 있는 추리 게임으로, 상대방이 설정한 **3자리의 숫자**를 맞히는 것이 목표입니다. 
각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다. 
예를 들어, **상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다.** 
이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.

#필수 구현기능 가이드

# LV.1 2024.11.04
1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

## 기능구현
세자리수를 바로 입력할수 있습니다.
입력된 수와 컴퓨터가 랜덤으로 제공하는 값의 일치여부를 확인 할수 있습니다. 
문자열 입력시 에러 메세지가 출력됩니다.

# LV.2 2024.11.05
정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다.
힌트는 야구용어인 **볼**과 **스트라이크**입니다.
같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다

## 기능구현
BaseBallGameLogic() 함수를 생성했습니다
for문을과 enumerated() 통해서 랜덤숫자의 인덱스와 요소를 튜플의 형태로 추출합니다.
각 인덱스 넘버를 비교하고 조건이 true면 스트라이크 카운드를 증가시키는 로직을 구현했습니다.
countStrike 변수가 3이 된다는건 숫자가 일치한다는것이니 "정답"을 출력하고 break를 통해 반복문을 벗어납니다.

# Lv.3 2024.11.05
정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
 맨 앞자리에 0이 오는 것은 불가능합니다
        - 092 → 불가능
        - 870 → 가능
        - 300 → 불가능

## 기능구현
랜덤값 추출 로직과 배열 생성 로직을 분리했습니다.
createRadomNumber() - 랜덤값 추출 로직
getRadomNumberArray() - 배열 생성 로직
랜덤값범위는 100~999까지 변경했고 반복과 조건문을 통해서 숫자 0이 두번나오는 경우는 랜덤숫자들 다시생성하고 
조건에 일치하는 랜덤 숫자가 생성된다면  "100으로나눴을때 나머지가0이 아닐때와 100보다 큰 경우" 라는 조건을 만나서 반복문을 벗어납니다.


# Lv.4 2024.11.05
프로그램을 시작할 때 안내문구를 보여주세요
환영합니다! 원하시는 번호를 입력해주세요
1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
   1번 게임 시작하기의 경우 “필수 구현 기능” 의 예시처럼 게임이 진행됩니다

## 기능구현
userInterFace()라는 함수를 구현했습니다.
함수 내부에 switch문을 활용해서 입력값에 대한 분기처리를 했습니다
게임시작에 해당하는 1번을 입력하면 BaseBallGame내 start함수를 호출합니다.
3스트라이크 즉,게임이 종료되면 게임 로직함수 내부에 userInterFace()를 호출하는 방식으로 안내문구 재출력 기능을 구현했습니다.


# Lv.5 2024.11.06
2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다

## 기능구현
시도횟수와 게임 시도횟수는 게임내에서 전체적으로 공유가 되야된다고 생각해서 전역변수로 설정했습니다.
시도횟수는 사용자가 입력값을 넣을때마다 카운트가 증가합니다.
게임카운트는 readyGame() 함수 내부에 넣어 readyGame() 호출될때마다 카운드가 증가하게 만들었습니다.
각 카운드 숫자들은 배열에 차곡차곡 저장되어 for문을 통해서 요소를 출력해냅니다.

# Lv.6 2024.11.06
3번 종료하기의 경우 프로그램이 종료됩니다

## 기능구현
switch문을 통한 분기처리를 통해 구현했습니다.
2번을 누르면  userInterface() 함수를 호출해서 다시 메뉴화면이 뜨게끔 구현했습니다.
endGame() 이라는 함수를 생성해서 카운트를 0으로 초기화 시키는 코드를 작성했습니다.
3번을 누르면 endGame() 함수가 호출 됩니다.
