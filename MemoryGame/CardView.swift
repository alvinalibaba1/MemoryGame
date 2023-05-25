//
//  CardView.swift
//  MemoryGame
//
//  Created by temp on 23/05/23.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card: Card
    let width: Int
    
    @Binding var MatchedCards: [Card]
    @Binding var UserChoices: [Card]
    
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: { $0.id == card.id }) {
        Text(card.text)
            .font(.system(size: 50))
            .padding()
            .frame(width: CGFloat(width), height: CGFloat(width))
            .background(Color(red: 0.68, green: 0.83, blue: 0.96))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
            )
        } else {
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
            )
                .onTapGesture {
                    if UserChoices.count == 0 {
                        card.turnOver()
                        UserChoices.append(card)
                    } else if UserChoices.count == 1 {
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(1)) {
                            for thisCard in UserChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMath()
                    }
                }
        }
    }
    
    func checkForMath(){
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
        }
        UserChoices.removeAll()
    }
}
