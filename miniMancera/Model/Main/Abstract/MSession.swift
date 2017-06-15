import Foundation

class MSession
{
    static let sharedInstance:MSession = MSession()
    private(set) var settings:DSettings?
    
    private init()
    {
    }
}
