import Foundation
import StoreKit

class MStore
{
    private(set) var mapItems:[String:MStoreItem]
    private(set) var references:[String]
    private let priceFormatter:NumberFormatter
    var error:String?
    
    init(options:[MHomeOptionsPurchase])
    {
        priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = NumberFormatter.Style.currencyISOCode
        mapItems = [:]
        references = []
        
        for option:MHomeOptionsPurchase in options
        {
            guard
                
                let item:MStoreItem = MStoreItem(option:option)
            
            else
            {
                continue
            }
            
            addPurchase(item:item)
        }
    }
    
    //MARK: private
    
    private func addPurchase(item:MStoreItem)
    {
        let purchaseId:String = item.purchaseId
        mapItems[purchaseId] = item
        references.append(purchaseId)
    }
    
    //MARK: public
    
    func loadSkProduct(skProduct:SKProduct)
    {
        let productId:String = skProduct.productIdentifier
        
        guard
            
            let mappedItem:MStoreItem = mapItems[productId]
            
        else
        {
            return
        }
        
        mappedItem.skProduct = skProduct
        priceFormatter.locale = skProduct.priceLocale
        
        let priceNumber:NSDecimalNumber = skProduct.price
        
        guard
            
            let priceString:String = priceFormatter.string(from:priceNumber)
            
        else
        {
            return
        }
        
        mappedItem.foundPurchase(price:priceString)
    }
    
    func updateTransactions(transactions:[SKPaymentTransaction])
    {
        for skPaymentTransaction:SKPaymentTransaction in transactions
        {
            let productId:String = skPaymentTransaction.payment.productIdentifier
            
            guard
                
                let mappedItem:MStoreItem = mapItems[productId]
                
            else
            {
                continue
            }
            
            switch skPaymentTransaction.transactionState
            {
            case SKPaymentTransactionState.deferred:
                
                mappedItem.statusDeferred()
                
                break
                
            case SKPaymentTransactionState.failed:
                
                mappedItem.statusNew()
                SKPaymentQueue.default().finishTransaction(skPaymentTransaction)
                
                break
                
            case SKPaymentTransactionState.purchased,
                 SKPaymentTransactionState.restored:
                
                mappedItem.statusPurchased(callAction:true)
                SKPaymentQueue.default().finishTransaction(skPaymentTransaction)
                
                break
                
            case SKPaymentTransactionState.purchasing:
                
                mappedItem.statusPurchasing()
                
                break
            }
        }
    }
}
