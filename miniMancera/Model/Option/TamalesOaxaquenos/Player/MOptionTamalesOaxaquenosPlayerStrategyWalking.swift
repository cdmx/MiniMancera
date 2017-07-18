import UIKit

class MOptionTamalesOaxaquenosPlayerStrategyWalking:MGameStrategy<
    MOptionTamalesOaxaquenosPlayer,
    MOptionTamalesOaxaquenos>
{
    private var lastElapsedTime:TimeInterval?
    private let kDeltaTime:TimeInterval = 0.1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > kDeltaTime
            {
                walk(deltaTime:deltaTime)
                self.lastElapsedTime = elapsedTime
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
            startWalking()
        }
    }
    
    //MARK: private
    
    private func startWalking()
    {
        model.view?.startWalking()
    }
    
    private func walk(deltaTime:TimeInterval)
    {
        let deltaTime:CGFloat = CGFloat(deltaTime)
        
        model.view?.walk(moveAmount:deltaTime)
    }
}
