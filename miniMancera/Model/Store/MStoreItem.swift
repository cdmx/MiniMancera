import Foundation
import StoreKit

class MStoreItem
{
    var skProduct:SKProduct?
    let purchaseId:String
    private(set) weak var option:MHomeOptionsPurchase!
    private(set) var price:String?
    private(set) var status:MStoreStatusProtocol?
    
    init?(option:MHomeOptionsPurchase)
    {
        guard
            
            let dataOption:DOptionPurchase = option.dataOption as? DOptionPurchase,
            let purchaseId:String = dataOption.purchaseId
        
        else
        {
            return nil
        }
        
        self.purchaseId = purchaseId
        self.option = option
        status = MStoreStatusNotAvailable()
    }
    
    //MARK: public
    
    func purchaseAction()
    {
    }
    
    func buyingError() -> String?
    {
        return nil
    }
    
    func validatePurchase() -> Bool
    {
        return false
    }
    
    //MARK: final
    
    final func foundPurchase(price:String)
    {
        self.price = price
        
        let isPurchased:Bool = validatePurchase()
        
        if isPurchased
        {
            statusPurchased(callAction:false)
        }
        else
        {
            statusNew()
        }
    }
    
    final func statusNew()
    {
        status = MStoreStatusNew()
    }
    
    final func statusDeferred()
    {
        status = MStoreStatusDeferred()
    }
    
    final func statusPurchasing()
    {
        status = MStoreStatusPurchasing()
    }
    
    final func statusPurchased(callAction:Bool)
    {
        status = MStoreStatusPurchased()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            if callAction
            {
                self?.purchaseAction()
            }
        }
    }
}
