//
//  Friend.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 04.05.2021.
//



struct Friend: Decodable {
    let name: String
    let skill: String
    let photo: String
}


enum URLExamples: String {
    case UrlJson = "https://pastebin.com/raw/43sXsbvq"
}

enum UserActions: String, CaseIterable {
    case friends = "friends"
    case friendsInInterface = "Friends with interface"
}


