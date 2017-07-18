import Foundation

class MOptionTamalesOaxaquenosPlayerStrategyJump:MGameStrategy<
    MOptionTamalesOaxaquenosPlayer,
    MOptionTamalesOaxaquenos>
{
    override init(model:MOptionTamalesOaxaquenosPlayer)
    {
        super.init(model:model)
        model.view?.jump()
    }
}
