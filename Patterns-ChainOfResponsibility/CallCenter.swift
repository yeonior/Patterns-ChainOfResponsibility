//
//  CallCenter.swift
//  Patterns-ChainOfResponsibility
//
//  Created by Ruslan on 02.02.2022.
//

import Foundation

final class CallCenter {
    
    private var specialist: Responder
    private var manager: Responder
    private var expert: Responder
    
    init(specialist: Responder, manager: Responder, expert: Responder) {
        self.specialist = specialist
        self.manager = manager
        self.expert = manager
    }
    
    func receiveCall(question: String) {
        print(specialist.answer(for: question))
    }
}
