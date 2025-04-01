//
//  Model.swift
//  Aula7
//
//  Created by Turma01-28 on 27/03/25.
//

import Foundation

struct SUChars: Decodable, Hashable {
    let name: String
    let img: String
    let isFusion: Bool
    let fusionGems: [String]?
}



