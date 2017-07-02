import UIKit

class MOptionPollutedGardenPlayer:MGameUpdate<MOptionPollutedGarden>
{
    private(set) var desiredPositionX:CGFloat
    private(set) var positionX:CGFloat
    private var strategy:MGameStrategy<MOptionPollutedGardenPlayer, MOptionPollutedGarden>?
    private let kSpeed:CGFloat = 150
    private let kPositionY:CGFloat = 93
    
    override init()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        positionX = sceneWidth / 2.0
        desiredPositionX = positionX
        
        super.init()
    }
    
    weak var view:VOptionPollutedGardenPlayer?
    {
        didSet
        {
            updateViewPosition()
        }
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: private
    
    private func updateViewPosition()
    {
        let point:CGPoint = CGPoint(x:positionX, y:kPositionY)
        
        view?.position = point
    }
    
    //MARK: public
    
    func activateGame()
    {
        strategy = MOptionPollutedGardenPlayerStrategyWait(model:self)
    }
    
    func reachedPosition()
    {
        view?.stop()
        strategy = MOptionPollutedGardenPlayerStrategyWait(model:self)
    }
    
    func walkToPoint(desiredPositionX:CGFloat)
    {
        self.desiredPositionX = desiredPositionX
        
        if desiredPositionX > positionX
        {
            strategy = MOptionPollutedGardenPlayerStrategyWalkRight(model:self)
        }
        else if desiredPositionX < positionX
        {
            strategy = MOptionPollutedGardenPlayerStrategyWalkLeft(model:self)
        }
        else
        {
            reachedPosition()
        }
    }
    
    func walk(direction:CGFloat, elapsedTime:TimeInterval)
    {
        let time:CGFloat = CGFloat(elapsedTime) * direction
        let walkAmount:CGFloat = time * kSpeed
        positionX += walkAmount
        
        updateViewPosition()
    }
    
    func defeated()
    {
        strategy = MOptionPollutedGardenPlayerStrategyDefeated(model:self)
    }
}
