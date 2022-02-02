//
//  ViewController.swift
//  Patterns-ChainOfResponsibility
//
//  Created by Ruslan on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let callCenter = makeCallCenter()
        let commonQuestion = "Common question"
        let complexQuestion = "Complex question"
        
        callCenter.receiveCall(question: commonQuestion)
        callCenter.receiveCall(question: complexQuestion)
    }

    func makeCallCenter() -> CallCenter {
        let specialist = Responder(qa: ["Common question": "The answer for common question\n"])
        let manager = Responder(qa: ["Specific question": "The answer for specific question\n"])
        let expert = Responder(qa: ["Complex question" : "The answer for complex question\n"])
        
        specialist.setNext(manager)
        manager.setNext(expert)
        
        return CallCenter(specialist: specialist, manager: manager, expert: expert)
    }
}

