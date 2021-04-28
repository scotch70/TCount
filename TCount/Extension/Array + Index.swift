//
//  Array + Index.swift
//  TCount
//
//  Created by L.T.A Neeft on 27/04/2021.
//

import SwiftUI

extension Array where Element: Identifiable {
    func firstIndext(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
