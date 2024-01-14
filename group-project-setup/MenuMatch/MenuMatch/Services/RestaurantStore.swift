import Foundation

import SwiftUI

//this will be used for the restaurants we have chosen that have won
class RestaurantStore: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var pricingData: [(price: String, count: Int)] = [("$", 0),("$$", 0),("$$$", 0),("$$$$", 0),("$$$$$", 0)]
    @Published var starsData: [(star: String, count: Int)] = [("1", 0),("2", 0),("3", 0),("4", 0),("5", 0)]
    
    func updateData(dataType: String, restaurant: Restaurant) {
        if dataType == "pricing" {
            if restaurant.price == "$" {
                pricingData[0].count += 1
            }
            if restaurant.price == "$$" {
                pricingData[1].count += 1
            }
            if restaurant.price == "$$$" {
                pricingData[2].count += 1
            }
            if restaurant.price == "$$$$" {
                pricingData[3].count += 1
            }
            if restaurant.price == "$$$$$" {
                pricingData[4].count += 1
            }
        }
        else {
            if restaurant.rating > 4 {
                starsData[4].count += 1
            }
            else if restaurant.rating > 3 {
                starsData[3].count += 1
            }
            else if restaurant.rating > 2 {
                starsData[2].count += 1
            }
            else if restaurant.rating > 1 {
                starsData[1].count += 1
            }
            else if restaurant.rating > 0 {
                starsData[0].count += 1
            }
        }
    }

    func addRestaurant(_ restaurant: Restaurant) {
        if !restaurants.contains(restaurant) {
            restaurants.append(restaurant)

            updateData(dataType: "pricing", restaurant: restaurant)
            updateData(dataType: "stars", restaurant: restaurant)
        }
    }
    
    func deleteRestaurant(_ restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants.remove(at: index)
        }
    }
}




