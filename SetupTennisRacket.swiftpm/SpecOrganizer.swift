//
//  SpecOrganizer.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

enum Destination: String, CaseIterable {
    case weight
    case headSize
    case stringPattern
    case balance
    case swingWeight
    
    @ViewBuilder
    static func view(forSelection selection: Destination) -> some View {
        switch selection {
        case .weight:
            WeightView()
        case .headSize:
            HeadSizeView()
        case .stringPattern:
            StringPatternView()
        case .balance:
            BalanceView()
        case .swingWeight:
            SwingWeightView()
        
        }
    }
}

struct SpecData {
    static var homeContent = [
        
        Spec(
            title: "Weight",
            description: "The weight of the racket. Is heavier always better?",
            systemSymbol: "scalemass",
            destination: .weight
        ),
        Spec(
            title: "Head Size",
            description: "The head size of the racket. What are the advantages of a smaller size?",
            systemSymbol: "square.on.circle",
            destination: .headSize
        ),
        Spec(
            title: "String Pattern",
            description: "The horizontal and vertical lines of the racket. Narrow and wide!",
            systemSymbol: "square.grid.3x3",
            destination: .stringPattern
        ),
        Spec(
            title: "Balance",
            description: "The racket's center of gravity. Is it better to have a perfect balance in the middle?",
            systemSymbol: "scale.3d",
            destination: .balance
        ),
        Spec(
            title: "Swing Weight",
            description: "The force of swinging a racket. Not the same as Weight",
            systemSymbol: "dumbbell",
            destination: .swingWeight
        )
    ]
}
