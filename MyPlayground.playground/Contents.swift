import UIKit

enum Spoiler {
    case exist,notexist
}

enum Mode {
    case sport,normal,eco
}

enum Hatch {
    case open,closed
}

enum Window {
    case open,close
}

enum Engine {
    case started,stoped
}

protocol Car {
    
    var brand: String {get}
    var year: Int {get}
    var trunkVolume: Int {get}
    var engineIsStarted: Engine {get set}
    var windowIsOpen: Window {get set}
}

extension Car {
        
        func filledVolumeOfTrunk(_ value: Int) -> Int{
            return self.trunkVolume - value
        }
        mutating func setEngineState(_ value: Engine){
            engineIsStarted = value
        }
        mutating func setWindowState(_ value: Window){
            windowIsOpen = value
        }
}

class TrunkCar: Car {
    
    var countOfWheels: Int
    var hatchIs: Hatch
    var brand: String
    var year: Int
    var trunkVolume: Int
    var engineIsStarted: Engine
    var windowIsOpen: Window
    
    init(brand: String, year: Int, trunkVolume: Int,engineIsStarted: Engine, windowIsOpen: Window, countOfWheels: Int, hatchIs: Hatch) {
         
            self.hatchIs = hatchIs
            self.countOfWheels = countOfWheels
            self.brand = brand
            self.year = year
            self.trunkVolume = trunkVolume
            self.engineIsStarted = engineIsStarted
            self.windowIsOpen = windowIsOpen
    }
    
}

class SportCar: Car {
    
    var spoilerIs: Spoiler
    var mode: Mode
    var brand: String
    var year: Int
    var trunkVolume: Int
    var engineIsStarted: Engine
    var windowIsOpen: Window
    
    init(brand: String, year: Int, trunkVolume: Int,engineIsStarted: Engine, windowIsOpen: Window, mode: Mode, spoilerIs: Spoiler) {
        
            self.mode = mode
            self.spoilerIs = spoilerIs
            self.brand = brand
            self.year = year
            self.trunkVolume = trunkVolume
            self.engineIsStarted = engineIsStarted
            self.windowIsOpen = windowIsOpen
        
    }
    
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return "I am Sport Car!"
    }
    
    func printInfo() {
        print("""
        
        Brand is: \(brand)
        Year is: \(year)
        Trunk volume is: \(trunkVolume)
        Engine is: \(engineIsStarted)
        Window is: \(windowIsOpen)
        Spoiler is: \(spoilerIs)
        Mode is: \(mode)
        
        """)
    }
    
}

extension TrunkCar: CustomStringConvertible{
    var description: String {
        return "I am Trunk Car!"
    }
    func printInfo() {
        print("""
        
        Brand is: \(brand)
        Year is: \(year)
        Trunk volume is: \(trunkVolume)
        Engine is: \(engineIsStarted)
        Window is: \(windowIsOpen)
        Count of wheels: \(countOfWheels)
        Hatch is: \(hatchIs)
        
        """)
    }
    
}

var manCar = TrunkCar(brand: "Man", year: 2018, trunkVolume: 1000, engineIsStarted: .started, windowIsOpen: .close, countOfWheels: 6, hatchIs: .open)
manCar.printInfo()
manCar.setEngineState(.stoped)
manCar.printInfo()

var bmwCar = SportCar(brand: "BMW", year: 2015, trunkVolume: 600, engineIsStarted: .stoped, windowIsOpen: .close, mode: .eco, spoilerIs: .notexist)
bmwCar.printInfo()
bmwCar.setWindowState(.open)
bmwCar.printInfo()
