import SpriteKit

class MOptionReformaCrossingHud:MGameUpdateProtocol
{
    weak var view:VOptionReformaCrossingHud?
    private var elapsedTime:TimeInterval?
    private let kMaxTime:TimeInterval = 32
    private let kTimeDelta:TimeInterval = 0.1
    
    //MARK: private
    
    private func timeOut(scene:VOptionReformaCrossingScene)
    {
        let model:MOptionReformaCrossing = scene.controller.model
        model.timeOut()
        
        let soundFail:SKAction = model.sounds.soundFail
        scene.controller.playSound(actionSound:soundFail)
    }
    
    private func updateStrings(scene:VOptionReformaCrossingScene, score:Int)
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
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if deltaTime > kTimeDelta
            {
                self.elapsedTime = elapsedTime
                
                guard
                    
                    let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
                    
                else
                {
                    return
                }
                
                let score:Int = scene.controller.model.score
                updateStrings(scene:scene, score:score)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
