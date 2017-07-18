import Foundation

class MOptionTamalesOaxaquenosPlayer:MGameUpdate<MOptionTamalesOaxaquenos>
{
    weak var view:VOptionTamalesOaxaquenosPlayer?
    private var strategy:MGameStrategy<MOptionTamalesOaxaquenosPlayer, MOptionTamalesOaxaquenos>?
    
    override init()
    {
        super.init()
        
        stand()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func stand()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyStand(model:self)
    }
    
    func walk()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyWalking(model:self)
    }
}
