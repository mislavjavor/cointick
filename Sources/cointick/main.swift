import SwiftCLI
import Cocoa
import Rainbow
import Alamofire

enum CointickError: String, Error {
    case dataConversionFailed = "Data conversion failed"
}

var shouldExit: Bool = false

let cli = CLI(name: "cointick",
              version: "0.1.0",
              description: "Cryptocurrency coin ticker")








if #available(OSX 10.12, *) {
    cli.commands = [
        ShowCommand(),
        AddCommand()
    ]
} else {
    // Fallback on earlier versions
}

cli.go()

CFRunLoopRun()

