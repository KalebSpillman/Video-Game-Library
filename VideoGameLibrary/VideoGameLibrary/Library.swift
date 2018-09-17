//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Kaleb Spillman on 9/13/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import Foundation

class Library {
    //the array of games for our library
    var gameArray : [Game] = [Game(title: "Spiderman"), Game(title: "2K19"), Game(title: "Fortnite"), Game(title: "Madden")]
    // function to add a game to the library
    func addGame()  {
        print("what game would you like to add")
        var newGameTitle = readLine()
        //while loop to tell the user they entered an invalid title
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title. Please enter the game title.")
            newGameTitle = readLine()
            
        }
        
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
    }
    //function to list avaliable games in the library
    func listAvaliableGames () {
        for game in gameArray {
            if game.checkedIn == true{
            print(game.title)
        }
        }
    }
    //function to remove a game from the library
    func removeGame() {
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        print("please enter the number of the game you want to remove:")
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<gameArray.count)
        
        while userInput == nil || validGameIndex.contains(userInput!) {
            print("Invalid input, please enter a valid index.")
            userInput = Int(readLine()!)
            
        }
        gameArray.remove(at: userInput!)
    }
    //function to check out a game
    func checkOutGame() {
        for index in 0..<gameArray.count{
            if gameArray[index].checkedIn == true {
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("please enter the index of the game you wish to checked out:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a useable index.")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = false
        
        let currentCalender = Calendar.current
        let dueDate = currentCalender.date(byAdding: .day, value: 14, to: Date())
        gameArray[userInput!].dueDate = dueDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        print("the game is due on : \(dateFormatter.string(from: dueDate!))")
    }
    //function to check a game back in
    func checkGameIn () {
        for index in 0..<gameArray.count{
            if gameArray[index].checkedIn == false {
                print("\(index). \(gameArray[index].title)")
            }
            
        }
        //getting the users input for the game they want to check out
        print("Please enter the index of the game you woukd like to check in:")
        var userInput = Int(readLine()!)
        
        //telling the user that they have entered an invalid function
        while userInput == nil {
            print("invalid input. please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = true
        
        gameArray[userInput!].dueDate = nil
    }
    //function that list the games avaliable to play
    func listUnavalibleGames () {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "mm/dd/yyyy"
                    print("\(game.title) is due on: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
}


