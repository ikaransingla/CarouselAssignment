//
//  PageControl.swift
//  CarouselAssignment
//
//  Created by Karan Singla on 28/04/25.
//

import SwiftUI

struct PageControl: View {
    var currentPage: Int
    var numberOfPages: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentPage == index ? Color.primary : Color.secondary.opacity(0.4))
                    .frame(width: 8, height: 8)
            }
        }
    }
}
