import UIKit

class MOptionReformaCrossingFoeItem
{
    let initialPositionX:CGFloat
    let endingPositionX:CGFloat
    let positionY:CGFloat
    let created:TimeInterval
    weak var view:VOptionReformaCrossingFoe!
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) weak var texture:MGameTexture!
    private(set) var minSpeed:CGFloat
    private(set) var currentPositionX:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private var strategy:MOptionReformaCrossingFoeStrategy?
    private let kPauseDuration:TimeInterval = 1
    
    required init?(lane:MOptionReformaCrossingLane)
    {
        return nil
    }
    
    init(lane:MOptionReformaCrossingLane, texture:MGameTexture)
    {
        self.texture = texture
        minSpeed = 0
        randomMaxSpeed = 0
        created = Date().timeIntervalSince1970
        positionY = lane.verticalPosition
        
        let foeWidth:CGFloat = texture.size.width
        initialPositionX = lane.foeInitialX(foeWidth:foeWidth)
        endingPositionX = lane.foeEndingX(foeWidth:foeWidth)
        currentPositionX = initialPositionX
        self.lane = lane
        lane.foes.append(self)
    }
    
    //MARK: private
    
    private func randomSpeed() -> CGFloat
    {
        let levelSpeed:CGFloat = 1 // controller.model.addedSpeed
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random + levelSpeed
        
        return totalSpeed
    }
}
