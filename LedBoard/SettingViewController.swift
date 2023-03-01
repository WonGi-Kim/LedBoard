//
//  SettingViewController.swift
//  LedBoard
//
//  Created by 김원기 on 2022/08/02.
//

import UIKit

//delegate이용하여 값 전달
protocol ledSettingDelegate : AnyObject {
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var pupple: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var orange: UIButton!
    
    weak var delegate: ledSettingDelegate?
    var ledText: String?
    //초기값
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView() //호출을 하지 않으면 led화면에서 전달한 값들이 뷰에 초기화가 되지 않음
    }
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    // 키보드 다운
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textField.resignFirstResponder() // textField 비활성화
        return true
    }
    
    //하나의 액션함수를 정의후 다른 버튼을 연결시켜주면 버튼이 호출된다 sender파라미터를 통해
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellow {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.pupple {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else if sender == self.green {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.black{
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blue {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.orange {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        //delegate이용해서 값을 넘겨줌
        self.delegate?.changeSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true)
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
