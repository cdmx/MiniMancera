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
        
        let foeWidth_2:CGFloat = texture.width_2
        initialPositionX = lane.foeInitialX(foeWidth_2:foeWidth_2)
        endingPositionX = lane.foeEndingX(foeWidth_2:foeWidth_2)
        positionY = lane.verticalPosition
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
