import Foundation

protocol MGameProtocol
{
    var gameId:String { get }
    var optionsClass:MHomeOptionsProtocol.Type { get }
}
