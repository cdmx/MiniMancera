import Foundation

class MOptionTamalesOaxaquenosPlayerStrategyDive:MGameStrategy<
    MOptionTamalesOaxaquenosPlayer,
    MOptionTamalesOaxaquenos>
{
    override init(model:MOptionTamalesOaxaquenosPlayer)
    {
        super.init(model:model)
        model.view?.dive()
    }
}
