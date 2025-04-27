//
//  CarouselView.swift
//  CarouselAssignment
//
//  Created by Karan Singla on 28/04/25.
//

import SwiftUI

struct CarouselView<T: Identifiable, Content: View>: View {
    var items: [T]
    var spacing: CGFloat = 8
    var widthOffset: CGFloat = 100
    @Binding var selectedIndex: Int?
    var content: (T) -> Content
    
    @State private var hasScrolledInitially = false

    init(
        items: [T],
        spacing: CGFloat = 8,
        widthOffset: CGFloat = 100,
        selectedIndex: Binding<Int?>,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.items = items
        self.spacing = spacing
        self.widthOffset = widthOffset
        self._selectedIndex = selectedIndex
        self.content = content
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: spacing) {
                        ForEach(Array(items.enumerated()), id: \.0) { (index, item) in
                            content(item)
                                .frame(width: UIScreen.main.bounds.width - widthOffset)
                                .aspectRatio(1, contentMode: .fit)
                                .zIndex(selectedIndex == index ? 1 : 0)
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(widthOffset / 2, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .scrollBounceBehavior(.basedOnSize)
                .scrollPosition(id: $selectedIndex)
                .onAppear {
                    if let selected = selectedIndex, !hasScrolledInitially {
                        proxy.scrollTo(selected, anchor: .center)
                        hasScrolledInitially = true
                    }
                }
            }
            
            if let selectedIndex = selectedIndex {
                PageControl(currentPage: selectedIndex, numberOfPages: items.count)
                    .padding(.top, 4)
            }
        }
    }
}

