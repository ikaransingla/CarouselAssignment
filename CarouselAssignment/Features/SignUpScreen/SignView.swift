//
//  SignView.swift
//  CarouselAssignment
//
//  Created by Karan Singla on 28/04/25.
//
import SwiftUI

struct SignView: View {
    @StateObject private var viewModel = SignupCarouselViewModel()
    @State private var selectedIndex: Int? = 1
    
    var body: some View {
        VStack {
            CarouselView(
                items: viewModel.items,
                spacing: -20,
                selectedIndex: $selectedIndex
            ) { item in
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

#Preview {
    SignView()
}

