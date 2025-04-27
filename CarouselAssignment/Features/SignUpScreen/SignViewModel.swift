//
//  SignViewModel.swift
//  CarouselAssignment
//
//  Created by Karan Singla on 28/04/25.
//
import Foundation

class SignupCarouselViewModel: ObservableObject {
    @Published var items: [SignupItem] = []

    init() {
        loadItems()
    }
    
    private func loadItems() {
        items = [
            SignupItem(imageName: "image1"),
            SignupItem(imageName: "image2"),
            SignupItem(imageName: "image3"),
        ]
    }
}
