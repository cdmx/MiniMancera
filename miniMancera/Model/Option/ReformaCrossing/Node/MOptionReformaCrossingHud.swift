import SpriteKit

class MOptionReformaCrossingHud
{
    weak var view:VOptionReformaCrossingHud?
    private var elapsedTime:TimeInterval
    private let kTimeOutString:String = "0"
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
        scene.run(model.sounds.soundFail)
    }
    
    private func updateStrings(scene:SKScene, score:Int)
    {
        let remainTime:TimeInterval = kMaxTime - elapsedTime
        let scoreString:String = "\(score)"
        let timeString:String
        
        if remainTime < 0
        {
            timeString = kTimeOutString
            timeOut(scene:scene)
        }
        else
        {
            let time:Int = Int(remainTime)
            timeString = "\(time)"
        }
        
        view?.update(time:timeString, score:scoreString)
    }
    
    //MARK: public
    
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
