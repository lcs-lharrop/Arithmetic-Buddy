//
//  AdditionView.swift
//  ArithmeticBuddy
//
//  Created by Russell Gordon on 2024-01-30.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The two numbers the user must add
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    
    @State var givenInput = ""
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // Feedback to the user
    @State var feedback = ""
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            Divider()
            
            
            TextField("Enter a sum", text: $givenInput)
                .font(Font.system(size: 50))
                .multilineTextAlignment(.trailing)
                .padding()
            
            
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 24.0,
                        relativeTo: .title3
                    )
                )
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        
        guard let guess = Int(givenInput) else { return feedback = "Please give a number! (e.g. 50)" }
        
        if guess == correctSum {
            feedback = "You've got it!"
        } else {
            feedback = "Try again!"
        }
    }
    
    // Reset for a new question
    func reset() {
        
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        feedback = ""
        
    }
}

#Preview {
    AdditionView()
}
