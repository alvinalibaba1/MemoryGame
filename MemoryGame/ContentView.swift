//
//  ContentView.swift
//  MemoryGame
//
//  Created by temp on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var userChoices = [Card]()
    
    var body: some View {
        GeometryReader{geo in
            VStack{
                Text("🌊 Ocean Memory 🌊")
                    .font(.custom("Marker Felt", fixedSize: 40))
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach(cards){card in
                        CardView(card: card, width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices: $userChoices)
                    }
                }
                
                VStack {
                    Text("Match these cards to win")
                    LazyVGrid(columns: sixColumnGrid, spacing: 5) {
                        ForEach (cardValues, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}) {
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
        }
        .background(Color(red: 0.68, green: 0.80, blue: 8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
