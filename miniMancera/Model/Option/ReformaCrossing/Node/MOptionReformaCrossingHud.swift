import SpriteKit

class MOptionReformaCrossingHud
{
    weak var view:VOptionReformaCrossingHud?
    private var elapsedTime:TimeInterval
//    private let kMaxTime:TimeInterval = 32
    private let kMaxTime:TimeInterval = 7
    private let kElapsedTimeDelta:TimeInterval = 0.1
    
    init()
    {
        elapsedTime = 0
    }
    
    //MARK: private
    
    private func timeOut(scene:SKScene)
    {
        guard
        
            let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
        
        else
        {
            return
        }
        
        let model:MOptionReformaCrossing = scene.controller.model
        model.timeOut()
        
        let soundFail:SKAction = model.sounds.soundFail
        scene.controller.playSound(actionSound:soundFail)
    }
    
    private func updateStrings(scene:SKScene, score:Int)
    {
        let remainTime:TimeInterval = kMaxTime - elapsedTime
        let scoreString:String = "\(score)"
        let time:Int
        
        if remainTime < 0
        {
            timeOut(scene:scene)
            time = 0
        }
        else
        {
            time = Int(remainTime)
        }
        
        let timeString:String = "\(time)"
        view?.update(time:timeString, score:scoreString)
    }
    
    //MARK: public
    
    func restart()
    {
        elapsedTime = 0
    }
    
    func update(elapsedTime:TimeInterval, scene:SKScene, score:Int)
    {
        let deltaElapsedTime:TimeInterval = elapsedTime - self.elapsedTime
        
        if deltaElapsedTime > kElapsedTimeDelta
        {
            self.elapsedTime = elapsedTime
            updateStrings(scene:scene, score:score)
        }
    }
}
