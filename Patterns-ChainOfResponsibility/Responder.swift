//
//  Responder.swift
//  Patterns-ChainOfResponsibility
//
//  Created by Ruslan on 02.02.2022.
//

import Foundation

final class Responder {
    
    private var qa: [String: String]
    private var next: Responder?
    
    init(qa: [String: String]) {
        self.qa = qa
    }
    
    func setNext(_ next: Responder) {
        self.next = next
    }
    
    func answer(for question: String) -> String {
        if let answer = qa[question] {
            print("--- Done!")
            return answer
        } else if let next = next {
            print("--- Can't handle it! Processing to the next...")
            return next.answer(for: question)
        }
        print("--- No answer!")
        return "Sorry! We'll call you later!"
    }
}
