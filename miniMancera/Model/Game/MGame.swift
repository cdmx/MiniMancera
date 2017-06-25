import UIKit

class MGame
{
    static let sceneSize:CGSize = UIScreen.main.bounds.size
    
    var score:Int
    private(set) var startSceneType:ViewGameScene<MGame>.Type?
    private(set) var soundBackground:String?
    private(set) var gameActive:Bool
    
    required init()
    {
        score = 0
        gameActive = false
    }
    
    //MARK: public
    
    func activateGame()
    {
        gameActive = true
    }
    
    func deActivateGame()
    {
        gameActive = false
    }
}