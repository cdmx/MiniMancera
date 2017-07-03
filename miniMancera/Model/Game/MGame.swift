import SpriteKit

class MGame
{
    static let sceneSize:CGSize = UIScreen.main.bounds.size
    
    var score:Int
    private(set) var startSceneType:SKScene.Type?
    private(set) var soundBackground:String?
    
    required init()
    {
        score = 0
    }
    
    //MARK: public
    
    func didMove()
    {
    }
    
    func startLevel()
    {
    }
    
    func activateGame()
    {
    }
    
    func deActivateGame()
    {
    }
    
    func gameStrategy<T:MGame>(modelType:T) -> MGameStrategyMain<T>?
    {
        return nil
    }
}
