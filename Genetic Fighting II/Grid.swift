//
//  Grid.swift
//  Genetic Fighting II
//
//  Created by Matthew Mohandiss on 9/6/15.
//  Copyright (c) 2015 Matthew Mohandiss. All rights reserved.
//

import SpriteKit
import Swift

class Grid {
    var columns = Int()
    var rows = Int()
    var grid = [[ObjectType]]()
    var cellSize = CGSize()
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        grid = [[ObjectType]](count: columns, repeatedValue: [ObjectType](count: rows, repeatedValue: ObjectType.empty))

        
    }
    
    func objectAt(location: GridCoordinate ) -> ObjectType {
        return .fighter
    }
    
    func addFighter(fighter: Fighter) {
        grid[fighter.location.x][fighter.location.y] = .fighter
    }
    
    func moveFighter(fighter: Fighter, direction: String) {
        switch direction {
            case "up":
            grid[fighter.location.x][fighter.location.y] = .empty
            grid[fighter.location.x][fighter.location.y + 1] = .fighter
            fighter.location.y++
            case "down":
                grid[fighter.location.x][fighter.location.y] = .empty
                grid[fighter.location.x][fighter.location.y - 1] = .fighter
            fighter.location.y--
            case "left":
                grid[fighter.location.x][fighter.location.y] = .empty
                grid[fighter.location.x - 1][fighter.location.y] = .fighter
            fighter.location.x--
            case "right":
                grid[fighter.location.x][fighter.location.y] = .empty
                grid[fighter.location.x + 1][fighter.location.y] = .fighter
            fighter.location.x++
        default:
            break
        }
    }
}

class GridCoordinate: Equatable {
    var x = Int()
    var y = Int()
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    }

func ==(lhs: GridCoordinate, rhs: GridCoordinate) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    
}

enum ObjectType {
    case empty, fighter, invalid, me, wall
}

func printGrid(grid: [[ObjectType]]) {
    for row in 0...(grid.count-1) {
        for column in 0...(grid.count-1) {
            let value = grid[row][column]
            switch value {
            case ObjectType.fighter:
                print("[*]", terminator: "")
            case ObjectType.empty:
                print("[ ]", terminator: "")
            case ObjectType.invalid:
                print("[X]", terminator: "")
            case ObjectType.me:
                print("[0]", terminator: "")
            case ObjectType.wall:
                print("[|]", terminator: "")
            }
        }
        print("")
    }
    print("")
}