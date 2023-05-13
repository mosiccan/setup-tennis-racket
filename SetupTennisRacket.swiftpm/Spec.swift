//
//  Spec.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

struct Spec: Identifiable, Hashable {
    var id : UUID = UUID()
    var title : String
    var description: String
    var systemSymbol : String
    var destination : Destination
}
