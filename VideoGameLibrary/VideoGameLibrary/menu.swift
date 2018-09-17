//
//  menu.swift
//  VideoGameLibrary
//
//  Created by Kaleb Spillman on 9/11/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import Foundation
//the menu class for the library
class Menu {
    let gameLibrary = Library()
    
    var shouldQuit = false
    //function that launches the library so the user can use it
    func go () {
        while !shouldQuit {
            print(printMenu())
            var input = getInput()
            while validateInput(input) == false {
                printMenu()
                input = getInput()
            }
            handleInput(input)
         
        }
    }
    //function to check if the input the user enters is valid
    func validateInput(_ input: String) -> Bool {
        let validMenuOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
        
        
        
     
    
    }
   //function to print the menu
    func printMenu() {
        print("""

//The menu for the library

Video Game Library
1. Add Game
2. Remove Game
3. List Avaliable Games
4. Check Out Game
5. Check In Game
6. List Checked Out Games
7. Quit

please enter a number between 1 and 8
""")
        //function that allows the user to be able to quit the application
    }
    func quit () {
        shouldQuit = true
        print("thanks for using the application.")
    }
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
           //Call the librarys add game function
            gameLibrary.addGame()
        case "2":
            //Call the librarys remove game function
            gameLibrary.removeGame()
        case "3":
            //call the list avaliable games function
            gameLibrary.listAvaliableGames()
        case "4":
          // call checkout game function
            gameLibrary.checkOutGame()
        case "5":
           // call check in game function
            gameLibrary.checkGameIn()
        case "6":
            // call list avalible games function
            gameLibrary.listUnavalibleGames()
        case "7":
           // call print menu function
            printMenu()
        case "8":
            //Call the quit function
            quit()
        default:
            break
        }
    }
    
    //Function to get input from the user
    func getInput() -> String {
        var input: String? = nil
        var userInput = readLine()
        //statement to tell the user that their input is invalid
        if userInput == nil || userInput == "" {
            print("Please enter a valid input.")
        }
        return userInput!
    }
    
    
}

