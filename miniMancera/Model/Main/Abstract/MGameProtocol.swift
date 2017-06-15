import Foundation

protocol MGameProtocol
{
    var gameId:String { get }
    var optionClass:MHomeOptionsProtocol.Type { get }
}
