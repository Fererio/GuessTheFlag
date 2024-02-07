//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Balaji Srinivas on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue,.cyan], startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 20)
                    }
                }
                
                Text("Your Score is: \(score)")
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.regular)
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)")
        }
        
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
