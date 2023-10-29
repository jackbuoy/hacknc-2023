//
//  ResultViewModel.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

class ResultViewModel: ObservableObject {
    @Published var currentWeek: [Date] = []
    
    @Published var currentDay: Date = .init()
    
    @Published var filteredActivities: [String]?
    
    @Published var day = 0
    
    @Published var romeItinerary: [[[String]]] = [
        [
            ["Visit the Colosseum"],
            ["Explore the Roman Forum"],
            ["Dine at a traditional Roman trattoria"]
        ],
        [
            ["Tour the Vatican Museums"],
            ["Visit St. Peter's Basilica"],
            ["Savor gelato at the Trevi Fountain"]
        ],
        [
            ["Explore the Pantheon"],
            ["Wander through Piazza Navona"],
            ["Enjoy a Roman opera performance"]
        ],
        [
            ["Discover the historic Palatine Hill"],
            ["Shop for souvenirs at Campo de' Fiori"],
            ["Indulge in pizza at a local pizzeria"]
        ],
        [
            ["Visit the Capitoline Museums"],
            ["Stroll through Villa Borghese gardens"],
            ["Experience Roman nightlife at Trastevere"]
        ],
        [
            ["Explore the Baths of Caracalla"],
            ["Take a guided tour of the Catacombs"],
            ["Sip wine at a wine bar in Monti"]
        ],
        [
            ["Day trip to Pompeii and Mount Vesuvius"],
            ["Discover the ancient city of Pompeii"],
            ["Hike to the summit of Mount Vesuvius"]
        ],
        [
            ["Visit the Castel Sant'Angelo"],
            ["Walk across the Tiber to Trastevere"],
            ["Dine along the Tiber River"]
        ],
        [
            ["Explore the Galleria Borghese"],
            ["Visit the Capuchin Crypt"],
            ["Savor pasta at a traditional Roman restaurant"]
        ],
        [
            ["Day trip to Tivoli: Villa d'Este and Hadrian's Villa"],
            ["Explore the magnificent gardens of Villa d'Este"],
            ["Learn about ancient Roman history at Hadrian's Villa"]
        ]
    ]


    @Published var storedActivities = [
        [
            ["Visit the North Carolina Research Campus"],
            ["Explore the Kannapolis History Room at the Kannapolis Branch Library"],
            ["Watch a movie at the Gem Theatre"]
        ],
        [
            ["Go for a hike at Frank Liske Park"],
            ["Visit Kannapolis City Hall and learn about the city's government"],
            ["Dine at a local restaurant in downtown Kannapolis"]
        ],
        [
            ["Take a stroll through Village Park and enjoy the scenery"],
            ["Visit the Kannapolis Fire Department Museum"],
            ["Attend a live music event at Veterans Park"]
        ],
        [
            ["Visit the Dale Earnhardt Plaza and learn about the racing legend"],
            ["Explore the North Carolina Music Hall of Fame"],
            ["Enjoy a performance at the Kannapolis Performing Arts Center"]
        ],
        [
            ["Visit the Old Courthouse Theatre and catch a play"],
            ["Explore the Kannapolis Train Station and learn about its history"],
            ["Have a picnic at the Fred M. Evans Amphitheater"]
        ],
        [
            ["Go shopping at the Northlite Shopping Center"],
            ["Visit the Kannapolis Recreation Park and enjoy outdoor activities"],
            ["Attend a sports game at the A.L. Brown Stadium"]
        ],
        [
            ["Visit the Curb Museum for Music and Motorsports"],
            ["Explore the North Carolina Science Festival at the North Carolina Research Campus"],
            ["Dine at a waterfront restaurant at Lake Fisher"]
        ],
        [
            ["Go for a bike ride along the Kannapolis Greenway"],
            ["Visit the Kannapolis Library for a book reading or workshop"],
            ["Watch a play at the Kannapolis Little Theatre"]
        ],
        [
            ["Take a yoga class at one of the local yoga studios"],
            ["Visit the Canapples Flea Market for unique finds"],
            ["Attend a cultural festival at the North Carolina Research Campus"]
        ],
        [
            ["Explore the art galleries in downtown Kannapolis"],
            ["Visit the Kannapolis Train Depot and learn about its history"],
            ["Have dinner at a rooftop restaurant with a view of the city"]
        ]
    ]

    init() {
        fetchCurrentWeek()
        // filterTodayTasks()
    }
    
//    func filterTodayTasks(){
//        DispatchQueue(qos:  .userInteractive).async {
//            let calendar  = Calendar.current
//
//
//
//        }
//
//    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        (1 ... 7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    func changeDate() {
        if day == 9 {
            day = 0
        }
        else {
            day = day + 1
        }
    }
    
    func getTasks(timeOfDay: Int) -> String {
        return storedActivities[day][timeOfDay][0]
    }
    
    func getRomeTasks(timeOfDay: Int) -> String {
        return romeItinerary[day][timeOfDay][0]
    }
}
