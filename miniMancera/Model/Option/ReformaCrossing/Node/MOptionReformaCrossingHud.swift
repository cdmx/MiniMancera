import SpriteKit

class MOptionReformaCrossingHud:MGameUpdate<MOptionReformaCrossing>
{
    weak var view:VOptionReformaCrossingHud?
    private var elapsedTime:TimeInterval?
    private let kMaxTime:TimeInterval = 32
    private let kTimeDelta:TimeInterval = 0.1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if deltaTime > kTimeDelta
            {
                self.elapsedTime = elapsedTime
                let score:Int = scene.controller.model.score
                updateStrings(scene:scene, score:score)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func timeOut(scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let model:MOptionReformaCrossing = scene.controller.model
        model.timeOut()
        
        let soundFail:SKAction = model.sounds.soundFail
        scene.controller.playSound(actionSound:soundFail)
    }
    
    private func updateStrings(scene:ViewGameScene<MOptionReformaCrossing>, score:Int)
    {
        guard
            
            let elapsedTime:TimeInterval = self.elapsedTime
        
        else
        {
            return
        }
        
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
}
