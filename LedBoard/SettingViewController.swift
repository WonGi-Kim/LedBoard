//
//  SettingViewController.swift
//  LedBoard
//
//  Created by 김원기 on 2022/08/02.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var pupple: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var orange: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //하나의 액션함수를 정의후 다른 버튼을 연결시켜주면 버튼이 호출된다 sender파라미터를 통해
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellow {
            self.changeTextColor(color: .yellow)
        } else if sender == self.pupple {
            self.changeTextColor(color: .purple)
        } else if sender == self.green {
            self.changeTextColor(color: .green)
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.black{
            self.changeBackgroundColor(color: .black)
        } else if sender == self.blue {
            self.changeBackgroundColor(color: .blue)
        } else if sender == self.orange {
            self.changeBackgroundColor(color: .orange)
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
    
    private func changeTextColor(color: UIColor) {
        // 삼항 연산자를 통해 노랑색 버튼의 알파값을 전달받은 컬러 색상에 맞춰 1 또는 0.2로 바꾸는 코드
        self.yellow.alpha = color == UIColor.yellow ? 1 : 0.2
        self.pupple.alpha = color == UIColor.purple ? 1 : 0.2
        self.green.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.black.alpha = color == UIColor.black ? 1 : 0.2
        self.blue.alpha = color == UIColor.blue ? 1 : 0.2
        self.orange.alpha = color == UIColor.orange ? 1 : 0.2
    }
    
}
